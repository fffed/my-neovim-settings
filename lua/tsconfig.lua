-- https://github.com/phelipetls/dotfiles/blob/91e6f4929273e0af974c8c78a104f5bdb9f06125/.config/nvim/lua/tsconfig.lua
local M = {}

-- Vim has a function to serialize JSON, `:h json_decode`, which is great, except
-- that tsconfig.json is not strictly JSON, since it allows comments. We can just
-- remove them before we pass it to json_decode:
local function remove_comments(line)
  return line:gsub("/%*.*%*/", ""):gsub("//.*", "")
end

local function decode_json_with_comments(fname)
  local json_without_comments = vim.tbl_map(remove_comments, vim.fn.readfile(fname))
  return vim.fn.json_decode(json_without_comments)
end

-- find_file is just a wrapper around `findfile` (:h findfile) that returns
-- `nil` if it doesn’t find one (empty strings are not falsy in Lua):
local function find_file(fname, path)
  local found = vim.fn.findfile(fname, path or "")
  if found ~= "" then
    return found
  end
end

local function find_dir(fname, path)
  local found = vim.fn.finddir(fname, path or "")
  if found ~= "" then
    return found
  end
end

-- Searching upwards starting from the current file’s directory
local function get_tsconfig_file()
  return find_file("tsconfig.json", ".;") or find_file("jsconfig.json", ".;")
end

-- Next step is to parse `compilerOptions.paths` to create a table that maps aliases
-- into their full paths. For example, given this configuration:
--
-- {
--   "compilerOptions": {
--     "baseUrl": ".",
--     "paths": {
--       "~/*": ["src/*"]
--     }
--   }
-- }
-- We want something like this:
--
-- {
--   "~/*": {
--     get_full_path(base_url) .. "src/"
--   }
-- }
-- This is because paths are relative to `compilerOptions.baseUrl`. Also, we should
-- remove the catch-all character *:
local function get_dir(fname)
  return vim.fn.fnamemodify(fname, ":h")
end

-- TS Config’s `extends` option allows to inherit from other configuration files.
-- If a tsconfig.json inherits from another configuration we’ll need to
-- recursively call `get_tsconfig_paths` for every tsconfig.json that has an `extends`
-- option, until it doesn’t
local function find_tsconfig_extends(extends, tsconfig_fname)
  if not extends or vim.startswith(extends, "@") then
    return
  end

  local tsconfig_dir = get_dir(tsconfig_fname)
  return vim.fn.simplify(tsconfig_dir .. "/" .. extends)
end

local function get_tsconfig_paths(tsconfig_fname, prev_base_url)
  if not tsconfig_fname then
    return {}
  end

  local json = decode_json_with_comments(tsconfig_fname)
  local base_url = json and json.compilerOptions and json.compilerOptions.baseUrl or prev_base_url

  local alias_to_paths = {}

  if json and json.compilerOptions and json.compilerOptions.paths then
    for alias, paths in pairs(json.compilerOptions.paths) do
      alias_to_paths[alias] =
        vim.tbl_map(
        function(path)
          return vim.fn.simplify(get_dir(tsconfig_fname) .. "/" .. base_url .. "/" .. path:gsub("*", ""))
        end,
        paths
      )
    end
  end

  local tsconfig_extends = find_tsconfig_extends(json.extends, tsconfig_fname)

  return vim.tbl_extend("force", alias_to_paths, get_tsconfig_paths(tsconfig_extends, base_url))
end

-- Get `.include` array from a tsconfig.json file as comma separated string.
local function get_tsconfig_include(tsconfig)
  if not tsconfig then
    return
  end
  local json = decode_json_with_comments(tsconfig)
  if json.include then
    return table.concat(json.include, ",")
  end
  return ""
end

function M.get_tsconfig_include()
  return get_tsconfig_include(get_tsconfig_file())
end


local function expand_tsconfig_path(input)
  local tsconfig_file = get_tsconfig_file()

  if not tsconfig_file then
    return input
  end

  local alias_to_paths = get_tsconfig_paths(tsconfig_file)

  if vim.tbl_isempty(alias_to_paths) then
    return input
  end

  for alias, paths in pairs(alias_to_paths) do
-- Check if the input filename matches the alias
-- (e.g., ~/file should match ~/* but also * since it means any value),
-- replace the alias with its path (~/file -> src/file) and try to find it
    if alias == "*" or vim.startswith(input, alias:gsub("*", "")) then
      for _, path in pairs(paths) do
        local expanded_path = input:gsub(alias, path)
        local real_path = find_file(expanded_path) or find_dir(expanded_path)

        if real_path then
          return real_path
        end
      end
    end
  end

  return input
end

function M.includeexpr(input)
  local path = expand_tsconfig_path(input)

  path = find_file(path) or find_dir(path) or input

  if vim.fn.isdirectory(path) == 1 then
    path = find_file("index", path) or path
  end

  return path
end

return M

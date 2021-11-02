"width for vertical linebreak
setlocal colorcolumn=120
if has("nvim")
  setlocal includeexpr=luaeval(\"require'tsconfig'.includeexpr(_A)\",v:fname)
endif

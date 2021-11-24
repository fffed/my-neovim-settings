# VARIABLES

To see where NVIM store its files
```
:echo $VIMRUNTIME
```

To open the configuration file:
```vim
:edit $MYVIMRC
```

# LAUNCH

if you have ever tried nvim -u min.vim to debug some project and were
frustrated that your plugins installed with packer were still running, use
the `--clean` flag:
`nvim -u min.vim --clean`

This behavior differs from `--no-plugin` in that it will allow you to run
plugins that you manually add to your rtp.


# FILES

Copy the entire file into the current file
```
:read some_file.txt
```

Copy the first 20 lines 
```
:read !head -20 some_file.txt
```

Copy the last 20 lines 
```
:read !tail -20 some_file.txt
```

Copy from some random place in the file
```
:read !sed -n 30,50p some_file.txt
```

Put into buffer output from external command:
```
:r!ls
```

Pretty printing the current json content in a buffer:
```
:%!jq
```

After renaming a file if the files are exactly the same (content wise), and by
that I mean a hash on the content is the same, you can use `:rundo <undofile>`
to read undofile from the old one.


# NAVIGATING


```
:b <fuzzy name of file in buffer>
```

```
:e **/<partial name of file not in buffer>
```

Search for {pattern} in the files {file} ... and set the error list to the matches.
```
:vim <search keyword> **/* to the find all references of something
```


# SEARCHING

## Content
To only find words that end in "end" use `\>`:
```
/end/>
```
Similarly `\<` only matches at the beginning of a word.

Thus to search for the word "the" only:
```
/\<the\>
```
This does not match "there" or "soothe".

`*` and `#` commands use these start-of-word and end-of-word markers to only find whole words.
We can use `g*` and `g#` to match partial words.


## Help
Use `:helpgrep` to search in all help pages (and also of any installed plugins).
To search for a topic:
```vim
:helpgrep topic
```
This takes you to the first match. To go to the next one: `:cnext`.
All matches are available in the quickfix window which can be opened with: `:copen`


## Global
The next option allows to use `:find {pattern}` to search a file name with
TAB-completion in the NVIM .config directory
```vim
set path+=~/.config/nvim
```
To allow to find in sub directories recursively we should add `**` sing to the path
```vim
set path+=~/.config/nvim/**
```

To enable Vim to use ripgrep (or any other grep program) as a backend to the grep command
```vim
set grepprg=rg\ --smart-case\ --vimgrep\ --hidden
```
And for searching 'data structures' run:
```vim
:grep! 'data structures'
```
Now you have your search results loaded in the quickfix menu, and can leverage
a Vim built-in plugin, `cfilter`. To add it, simply run:
```vim
packadd cfilter
```
and Vim will load the plugin for use.
`cfilter` filters through entries in the quickfix list via regex.
If you have search results that look like this:

```
datastructures.html|623| 30:        mixpanel.track("data structures loaded");
index.html|61| 26:          <a href="./datastructures.html"
index.html|62| 19:            >Data Structure Memes For Edgy JavaScript Teens</a
_site/index.js|64| 28:           import { customStructure } from './datstructures'
_site/utils.js|64| 28:           import { customStructure } from 'custom/datstructures'
```
If you want to only keep the search results from the JavaScript files, you run
this command: `:Cfilter! html`. This keeps everything except matches that contain
html in the quickfix list. If you wanted only to keep only the third match, you
run `:Cfilter Memes` and it keeps only matches containing Memes.

Some search examples:
- Search for foo in current working directory: `:grep foo`
- Search for foo in files under src/: `:grep foo src`
- Search for foo in current file directory: `:grep foo %:h`
- Search for foo in current file directory’s parent directory: `:grep foo %:h:h`
- Search for the exact word foo (not foobar): `:grep -w foo` (equivalent to `:grep '\bfoo\b'`).
- Search for foo in JavaScript files: `:grep foo -t js`
- Search for foo in files matching a glob: `:grep foo -g '*.js'`

To replace foo with bar across files (asking me to confirm before):
`:cdo s/foo/bar/gc`.
And then `:cfdo update`.

Creates a `:SearchProject` command, makes it so you don't have to escape
strings in ripgrep, will tab compete with directories in path.
```vim
command! -nargs=+ -complete=dir -bar SearchProject execute 'silent! grep!'.<q-args>.' | cwindow'
```

# HIGHLIGHTING

To view groups currently active in vim/nvim:
```vim
:so $VIMRUNTIME/syntax/hitest.vim
```

# DIFF
Open two files in a split, then run for each buffer `:diffthis`
or better - `:windo diffthis`

To turn off diffs run `:diffoff`


# GIT:FUGITIVE
- LOCAL - the head for the file(s) from the current branch on the machine that you are using.
- REMOTE - the head for files(s) from a remote location that you are trying to merge into your LOCAL branch.
- BASE - the common ancestor(s) of LOCAL and REMOTE.
- MERGED - the tag / HEAD object after the merge - this is saved as a new commit.

To view file changes in split mode press `dv`.

`cc` - Create a commit.
`ca` - Amend the last commit and edit the message.
`ce` - Amend the last commit without editing the message.
`cw` - Reword the last commit.

`Gvdiffsplit` - to see changes of the current file

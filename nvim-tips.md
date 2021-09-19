# VARIABLES

To see where NVIM store its files
```
:echo $VIMRUNTIME
```

# COPYING FILES

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
The next option allows to use `:find {pattern}` to search a file name with TAB-completion in the NVIM .config directory
```vim
set path+=~/.config/nvim
```
To allow to find in sub directories recursively we should add `**` sing to the path
```vim
set path+=~/.config/nvim/**
```

"these lines are suggested to be at the top of every colorscheme
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

"Load the 'base' colorscheme - the one you want to alter
"
source $HOME/.local/share/nvim/site/pack/packer/opt/vim-paper/colors/paper.vim
"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-paper"
set background=light

"Clear the colors for any items that you don't like
" hi clear Cursor 

"Set up your new & improved colors
hi Cursor     guifg=NONE    guibg=#bfbcaf gui=NONE           cterm=NONE
hi Comment    guifg=#6F6F6F guibg=NONE    gui=italic         cterm=NONE
hi IncSearch  guifg=NONE    guibg=#b58900 gui=bold           cterm=bold
hi Search     guifg=NONE    guibg=#b58900 gui=bold           cterm=bold
" hi SpellBad   guifg=#ED160E guibg=NONE    gui=bold,underline cterm=bold,underline
" hi SpellCap   guifg=#5c21a5 guibg=NONE    gui=underline      cterm=underline
" hi SpellLocal guifg=#216609 guibg=NONE    gui=underline      cterm=underline
" hi SpellRare  guifg=#5c21a5 guibg=NONE    gui=underline      cterm=underline
hi String     guifg=#093E3B guibg=NONE    gui=NONE           cterm=NONE
hi Todo       guifg=#6F6F6F guibg=NONE    gui=italic,bold    cterm=bold
hi diffAdded  guifg=#216609 guibg=NONE    gui=NONE           cterm=NONE

" COC
hi CocErrorHighlight   guisp=#ED160E gui=undercurl ctermfg=203 cterm=underline
hi CocWarningHighlight guisp=#b58900 gui=undercurl ctermfg=214 cterm=underline
hi CocInfoHighlight    guisp=#1858A0 gui=undercurl ctermfg=153 cterm=underline
hi CocHintHighlight    guisp=#1858A0 gui=undercurl ctermfg=153 cterm=underline
hi CocErrorSign        guifg=#ED160E ctermfg=203
hi CocWarningSign      guifg=#b58900 ctermfg=214
hi CocInfoSign         guifg=#1858A0 ctermfg=153
hi CocHintSign         guifg=#1858A0 ctermfg=153

"Tree-sitter
hi TSFunction guifg=#000000 guibg=NONE gui=italic,bold cterm=NONE
hi TSMethod guifg=#000000 guibg=NONE gui=italic cterm=NONE
hi TSProperty guifg=#383838 guibg=NONE gui=NONE cterm=NONE

"nvim-tree
hi LuaTreeFolderName guifg=#1e6fcc
hi LuaTreeGitNew guifg=#216609

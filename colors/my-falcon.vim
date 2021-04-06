"these lines are suggested to be at the top of every colorscheme
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

"Load the 'base' colorscheme - the one you want to alter
source $HOME/.config/nvim/pack/packager/opt/falcon/colors/falcon.vim
"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-falcon"
set background=dark

"Clear the colors for any items that you don't like
hi clear ColorColumn 
hi clear NonText
hi clear Normal
hi clear Statement

"Set up your new & improved colors
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#1F2324 ctermbg=234 gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#2B2A27 ctermbg=236 gui=NONE cterm=NONE
hi NonText guifg=#36363A ctermfg=237 guibg=#0B0C0D ctermbg=0 gui=NONE cterm=NONE
hi Normal guifg=#B4B4B9 ctermfg=249 guibg=#141819 ctermbg=0 gui=NONE cterm=NONE
hi Statement guifg=#798bb2 ctermfg=248 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

"#white
"color_normal = #D2CFCF
"
"#black
"color_dark_0 = #393636
"color_dark_1 = #222020
"color_dark_2 = #171616
"color_dark_3 = #121111
"
"#grey
"color_bright_0 = #5E5959
"color_bright_1 = #787271
"color_bright_2 = #9C9695
"
"color_hl_1 = #F54646 - red      --bright = #ff4444
"color_hl_2 = #F5AC46 - yellow   --dull   = #dd9922
"color_hl_3 = #46BBF5 - blue     --bright = 00afff
"color_eob  = #723030 - burgundy
"color_nt   = #9B4A3A - chestnut
"diff_change= #7788aa
"
"
"Load the 'base' colorscheme - the one you want to alter
source $HOME/.local/share/nvim/site/pack/packer/opt/vim-monotone/colors/monotone.vim
"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-monotone"
" let g:monotone_emphasize_whitespace = 1 " Emphasize whitespace

augroup contrast
    autocmd!
    " autocmd WinLeave * Monotone 120 100 70
    " autocmd WinEnter * Monotone 10 5 60
    " autocmd FocusLost * :colorscheme goodwolf
    " autocmd FocusGained * :colorscheme falcon
    " autocmd WinEnter * hi LineNr guifg=red
    " autocmd WinLeave * hi LineNr guifg=green
augroup END

"set different background for non-active windows
hi NormalNC guibg=#222020

hi Whitespace guifg=#723030

hi MatchParen guibg=#787271

hi Conceal guifg=#787271 gui=bold,italic

hi Todo guifg=#787271 guibg=NONE  gui=bold,italic
hi EndOfBuffer guifg=#7788aa

" hi ftFTSearch guifg=#46bbf5 gui=bold
" hi ftFTSight guifg=#171616 guibg=#5E5959 gui=bold

hi MarkSignHL guifg=#46bbf5
"git diffs
" hi diffAdded  guifg=#88aa77  guibg=NONE
" hi DiffRemoved guifg=#aa7766  guibg=NONE
hi DiffAdded  guifg=#56d364  guibg=#244032
hi DiffRemoved guifg=#f85149 guibg=#462c32
hi DiffChange guifg=#e3b341  guibg=NONE

"gitsigns
hi DiffDelete guifg=#f85149

" nvim-tree
hi NvimTreeFileDirty gui=bold
hi NvimTreeGitNew gui=bold
" hi NvimTreeFileDirty guifg=#E79191
hi NvimTreeGitDirty guifg=#F5AC46
hi NvimTreeRootFolder guifg=#9C9695
hi NvimTreeExecFile guifg=#7788aa
" hi LuaTreeFolderName guifg=#1e6fcc
" hi LuaTreeGitNew guifg=#216609

" Telescope
hi TelescopeSelection      gui=bold                 " selected item
hi TelescopeMultiSelection guifg=#787271 gui=bold   " selected item
hi TelescopeMatching       guifg=#F5AC46            " Used for highlighting characters that you match

" Tree-sitter
hi TSFunction guifg=#D2CFCF guibg=NONE gui=italic,bold cterm=NONE
hi TSMethod guifg=#D2CFCF guibg=NONE gui=italic cterm=NONE
" hi TSProperty guifg=#383838 guibg=NONE gui=NONE cterm=NONE
    " hi TSInclude guifg=#7788aa
    " hi TSExport guifg=#7788aa
    " hi TSKeyword guifg=#7788aa
    " hi TSArrow guifg=#7788aa

    " hi TSProperty guifg=#9C9695
    " hi TSJsxProp guifg=#9C9695                                                                                                                                                                    
    
    " hi TSDebugger guifg=#E04646 gui=bold
                                                                                                                                                                                                             
     " hi TSFunction guifg=#ebdbb2                                                                                                                                                                     
                                                                                                                                                                                                             
     " hi TSParameter guifg=#8ec07c                                                                                                                                                                    
     " hi TSConditional guifg=#8ec07c                                                                                                                                                                  
                                                                                                                                                                                                             
     " hi TSVariable guifg=#fbf1c7                                                                                                                                                                     
     " hi TSConstructor guifg=#fbf1c7                                                                                                                                                                  
     " hi TSPunctBracket guifg=#fbf1c7                                                                                                                                                                 
     " hi TSPunctDelimiter guifg=#fbf1c7                                                                                                                                                               
                                                                                                                                                                                                             
     " hi TSReturn guifg=#fb4934                                                                                                                                                                       
     " hi TSArrow guifg=#fb4934                                                                                                                                                                        
     " hi TSDebugger guifg=#fb4934 gui=bold                                                                                                                                                            
     " hi TSVariableBuiltin guifg=#fb4934                                                                                                                                                              
                                                                                                                                                                                                             
     " hi TSInclude guifg=#fe8019                                                                                                                                                                      
     " hi TSExport guifg=#fe8019                                                                                                                                                                       
                                                                                                                                                                                                            
     " hi TSKeyword guifg=#fe8019                                                                                                                                                                      
                                                                                                                                                                                                             
     " hi TSJsxProp guifg=#fabd2f                                                                                                                                                                      
     " hi TSJsxElement guifg=#b8bb26                                                                                                                                                                   
     " hi TSTag guifg=#8ec07c                                                                                                                                                                          
     " hi TSTagDelimiter guifg=#a89984 


"Load the 'base' colorscheme - the one you want to alter
"
source $HOME/.local/share/nvim/site/pack/packer/opt/vim-monotone/colors/monotone.vim
"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-monotone"

hi Whitespace guifg=#723030


"gitsigns
hi diffAdded  guifg=#88aa77  guibg=NONE
hi DiffRemoved guifg=#aa7766  guibg=NONE
" nvim-tree
hi NvimTreeFileDirty guifg=#AC3A3A
hi NvimTreeRootFolder guifg=#9C9695

" Telescope
hi TelescopeSelection      gui=bold                 " selected item
hi TelescopeMultiSelection guifg=#787271 gui=bold   " selected item
hi TelescopeMatching       guifg=#F5AC46            " Used for highlighting characters that you match

" Tree-sitter
hi TSFunction guifg=#D2CFCF guibg=NONE gui=italic,bold cterm=NONE
hi TSMethod guifg=#D2CFCF guibg=NONE gui=italic cterm=NONE
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


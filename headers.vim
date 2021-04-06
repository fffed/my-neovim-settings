let g:header_auto_add_header = 0
let g:header_field_filename = 0
let g:header_field_timestamp = 0
let g:header_field_modified_timestamp = 0
let g:header_field_modified_by = 0

let g:licenses_default_commands = ['epam']
" nmap <F5> :AddEPAMLicense<CR>
nmap <F5> :Epam<CR>

function! AddEpamHeader()
    "maybe finddir() suits better
    let currentPath = split(expand('%:~:h'), '/')
    let telescope = filter(currentPath, 'v:val ==? "telescope"')
    if len(telescope) > 0 && exists(':Epam')
        let l:save = winsaveview()
    " if len(telescope) > 0 && exists(':AddEPAMLicense')
        " execute 'AddEPAMLicense'
        execute 'Epam'
        call winrestview(l:save)
    endif
endfunction

augroup addHeader
  autocmd!
  autocmd BufWritePre *.js call AddEpamHeader()
  autocmd BufWritePre *.jsx call AddEpamHeader()
  autocmd BufWritePre *.ts call AddEpamHeader()
  autocmd BufWritePre *.tsx call AddEpamHeader()
  " autocmd BufWritePre *.json call AddEpamHeader()
augroup END

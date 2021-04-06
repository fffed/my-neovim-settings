let g:translator_target_lang    ='ru'
let g:translator_source_lang    ='en'
let g:translator_default_engines=['google']  "['google', 'bing', 'sdcv', 'trans']
let g:translator_history_enable =v:true

"Translate in popup window
"Once the translation window is opened, type <C-w>p to jump into it and again to jump back
nmap <silent> <Leader>t :<C-u>TranslateW<CR>
vmap <silent> <Leader>t :<C-u>TranslateWV<CR>


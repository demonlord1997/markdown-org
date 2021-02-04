if get(g:, 'language_path', {}) == {}
    let g:language_path = {
                \ "python":"python",
                \ "python3":"python3",
                \ "go": "go",
                \ "c": "gcc",
                \ "cpp": "g++",
                \ "c++": "g++",
                \ "javascript": "node",
                \ }
endif

if get(g:, 'default_quick_keys', 1)
    nnoremap <M-b> :call org#main#runCodeBlock()<CR>
    nnoremap <M-l> :call org#main#runLanguage()<CR>
endif

finish


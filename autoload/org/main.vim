let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/getlanguage.py'

let g:language_path = get(g:, 'language_path', ' ')

"```python
"
"```
func org#main#runCodeBlock()
    let curLineText =  getline('.')
    let codeBlockStartLN  = getpos('.')[1] + 1
    execute(':normal e')
    execute('/```')
    execute(':nohl')
    let codeBlockEndLN  = getpos('.')[1] - 1
    execute('py3f ' . expand(s:path))
    let resultText = system("sed -n '" . expand(codeBlockStartLN) . "," . expand(codeBlockEndLN) . "p' " . expand('%') . "| " . expand('g:language_path'))

    let resultList = split(resultText)
    let opts = {'title': 'result', 'border':5}
    call org#listbox#inputlist(resultList, opts)
    "echo resultText
endfunc

finish
"call org#main#runCodeBlock()

func org#main#test()
    let a = 44
    let b = 48
    "execute(':36,42w !python > tmp') . expand(xxx))
    let xxx = system("sed -n '" . expand(a) . "," . expand(b) . "p' " . expand('%') . '| python')
    let x = split(xxx)
    "let nx = len(x)
    "for i in range(nx)
    let content = x
    let opts = {'title': 'result', 'border':5}
    call org#listbox#inputlist(content, opts)
endfunc
call org#main#test()

finish
print(0)
print(0)
print(0)
print(0)
print(0)

import vim
import re


b = vim.current.buffer
startList = vim.eval("b:startList")
endList = vim.eval("b:endList")


language = []
languageKinds = []
for i in startList:
    curLineText = vim.eval('getline({})'.format(i))

    start, end = re.search(r'[a-zA-Z0-9\-\+#]+', curLineText).span()
    curLanguage = curLineText[start:end]
    language.append(curLanguage)
    if curLanguage not in languageKinds:
        languageKinds.append(curLanguage)

b.vars['language'] = language
b.vars['languageKinds'] = languageKinds
content = []
for lang in languageKinds:
    content.append([" \t {}".format(lang), 'call org#main#run("{}")'.format(lang)])

b.vars['content'] = content


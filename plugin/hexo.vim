
if !exists("g:hexoProjectPath")
    let g:hexoProjectPath = ""
endif


" Open project
fun! OpenHexoProject()
    execute "cd " . g:hexoProjectPath
endfun


" Edit new post 
function! OpenHexoPost(...)
    call OpenHexoProject ()
    let filename = "source/_posts/" . a:1 . ".md"
    execute "e " . filename
endfunction


" Edit new publish 
function! OpenHexoPlulish(...)
    call OpenHexoProject ()
    let filename = "source/_drafts/" . a:1 . ".md"
    execute "e " . filename
endfunction


" HexoNew
function! Hexo_New(...)
    call OpenHexoProject()
    let filename = a:1
    execute "!hexo new " . filename
    call OpenHexoPost(a:1)
endfunction


" HexoClean
function! Hexo_Clean()
    call OpenHexoProject()
    execute "!hexo clean" 
endfunction


" HexoGenerate
function! Hexo_Generate(...)
    call OpenHexoProject()
    execute "!hexo g" 
endfunction


" HexoPublish
function! Hexo_Publish(...)
    call OpenHexoProject()
    let filename = a:1
    execute "!hexo publish" . filename
    call OpenHexoPlulish(a:1)
endfunction


" HexoDeploy
function! Hexo_Deploy(...)
    call OpenHexoProject()
    call Hexo_Clean
    call Hexo_Generate
    execute "!hexo d" . filename
    call OpenHexoPost(a:1)
endfunction


" HexoServer
function! Hexo_Server(...)
    call OpenHexoProject()
    call Hexo_Clean
    call Hexo_Generate
    execute "!hexo s"
endfunction


command -nargs=+ HexoNew :call Hexo_New("<args>")
command HexoClean :call Hexo_Clean()
command HexoGenerate :call Hexo_Generate()
command -nargs=+ HexoPublish :call Hexo_Generate("<args>")
command HexoDeploy  :call Hexo_Deploy()
command HexoServer  :call Hexo_Server()

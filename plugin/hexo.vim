
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
function! OpenHexoDraft(...)
    call OpenHexoProject ()
    let filename = "source/_drafts/" . a:1 . ".md"
    execute "e " . filename
endfunction


" HexoNewPost
function! Hexo_New_Post(...)
    call OpenHexoProject()
    let filename = a:1
    execute "!hexo new " . filename
    call OpenHexoPost(a:1)
endfunction


" HexoNewDraft
function! Hexo_New_Draft(...)
    call OpenHexoProject()
    let filename = a:1
    execute "!hexo new  draft" . filename
    call  OpenHexoDraft(a:1)
endfunction


" HexoClean
function! Hexo_Clean()
    call OpenHexoProject()
    execute "!hexo clean" 
endfunction


" HexoGenerate
function! Hexo_Generate()
    call OpenHexoProject()
    execute "!hexo g" 
endfunction


" HexoPublish
function! Hexo_Publish(...)
    call OpenHexoProject()
    let filename = a:1
    execute "!hexo p" . filename
endfunction


" HexoDeploy
function! Hexo_Deploy()
    call OpenHexoProject()
    call Hexo_Clean
    call Hexo_Generate
    execute "!hexo d"
endfunction


" HexoServer
function! Hexo_Server()
    call OpenHexoProject()
    call Hexo_Clean
    call Hexo_Generate
    execute "!hexo s"
endfunction


command -nargs=+ HexoNewPost :call Hexo_New_Post("<args>")
command -nargs=+ HexoNewDraft :call Hexo_New_Draft("<args>")
command -nargs=+ HexoPublish :call Hexo_Publish("<args>")
command HexoClean :call Hexo_Clean()
command HexoGenerate :call Hexo_Generate()
command HexoDeploy  :call Hexo_Deploy()
command HexoServer  :call Hexo_Server()

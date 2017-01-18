"if has("win32")

if !exists("g:hexoProjectPath")
    let g:hexoProjectPath=""
endif


fun! OpenHexoProjPath()
    execute "cd " . g:hexoProjectPath
endfun

function! NewHexoPost(...)
    call OpenHexoProjPath()

    let filename = a:1
    execute "!hexo new " . filename

    call OpenHexoPost(a:1)
endfunction

command -nargs=+ HexoOpen :call OpenHexoPost("<args>")
command -nargs=+ HexoNew :call NewHexoPost("<args>")


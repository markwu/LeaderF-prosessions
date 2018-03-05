" ============================================================================
" File:        Prosessions.vim
" Description:
" Author:      Mark Wu
" Website:     https://github.com/markwu
" Note:
" License:     Apache License, Version 2.0
" ============================================================================

if leaderf#versionCheck() == 0
    finish
endif

exec g:Lf_py "import vim, sys, os.path"
exec g:Lf_py "cwd = vim.eval('expand(\"<sfile>:p:h\")')"
exec g:Lf_py "sys.path.insert(0, os.path.join(cwd, 'python'))"
exec g:Lf_py "from prosessionsExpl import *"

function! leaderf#Prosessions#getSessions()
        let sessions = glob(fnamemodify(g:prosession_dir, ':p').'*.vim', 0, 1)
        let sessions = map(sessions, "fnamemodify(v:val, ':t:r')")
        let sessions  = map(sessions, "substitute(v:val, '%', '/', 'g')")
        return sessions
endfunction

function! leaderf#Prosessions#Maps()
    nmapclear <buffer>
    nnoremap <buffer> <silent> <CR>          :exec g:Lf_py "prosessionsExplManager.accept()"<CR>
    nnoremap <buffer> <silent> o             :exec g:Lf_py "prosessionsExplManager.accept()"<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :exec g:Lf_py "prosessionsExplManager.accept()"<CR>
    nnoremap <buffer> <silent> q             :exec g:Lf_py "prosessionsExplManager.quit()"<CR>
    nnoremap <buffer> <silent> i             :exec g:Lf_py "prosessionsExplManager.input()"<CR>
    nnoremap <buffer> <silent> <F1>          :exec g:Lf_py "prosessionsExplManager.toggleHelp()"<CR>
endfunction

function! leaderf#Prosessions#startExpl(win_pos, ...)
    call leaderf#LfPy("prosessionsExplManager.startExplorer('".a:win_pos."')")
endfunction

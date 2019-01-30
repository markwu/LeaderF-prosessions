" ============================================================================
" File:        leaderf.vim
" Description:
" Author:      Mark Wu
" Website:     https://github.com/markwu
" Note:
" License:     Apache License, Version 2.0
" ============================================================================

command! -bar -nargs=0 LeaderfProsessions call leaderf#Prosessions#startExpl(g:Lf_WindowPosition)

" In order to be listed by :LeaderfSelf
call g:LfRegisterSelf("LeaderfProsessions", "navigate the obsession/prosession sessions")

let s:extension = {
            \   "name": "prosessions",
            \   "help": "navigate the obsession/prosession sessions",
            \   "registerFunc": "leaderf#Prosessions#register",
            \   "arguments": [
            \   ]
            \ }
call g:LfRegisterPythonExtension(s:extension.name, s:extension)

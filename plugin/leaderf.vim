" ============================================================================
" File:        leaderf.vim
" Description:
" Author:      Mark Wu
" Website:     https://github.com/markwu
" Note:
" License:     Apache License, Version 2.0
" ============================================================================

command! -bar -nargs=0 LeaderfProsessions call leaderf#Prosessions#startExpl(g:Lf_WindowPosition)

call g:LfRegisterSelf("LeaderfProsessions", "navigate the obsession/prosession sessions")

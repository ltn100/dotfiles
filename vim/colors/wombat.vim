" Maintainer: Lars H. Nielsen (dengmao@gmail.com)
" Last Change: January 22 2007

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine     guibg=#2a2a2a ctermbg=235 cterm=none term=none
  hi CursorColumn   guibg=#2a2a2a ctermbg=235
  hi MatchParen     guifg=#ffff44 guibg=#3d3d1d gui=bold ctermfg=227 ctermbg=58
  hi Pmenu          guifg=#f6f3e8 guibg=#444444 ctermfg=230 ctermbg=238
  hi PmenuSel       guifg=#000000 guibg=#cae682 ctermfg=0   ctermbg=150

  " Change cursor line in INSERT mode
  autocmd InsertLeave * hi CursorLine term=none cterm=none guibg=#2a2a2a ctermbg=235
  autocmd InsertEnter * hi CursorLine term=none cterm=none guibg=#3a2a2a ctermbg=236
endif

" General colors
hi Cursor       guifg=NONE    guibg=#656565 gui=none    ctermfg=NONE ctermbg=242    cterm=none
hi Normal       guifg=#f6f3e8 guibg=#242424 gui=none    ctermfg=230  ctermbg=234    cterm=none
hi NonText      guifg=#808080 guibg=#303030 gui=none    ctermfg=244  ctermbg=235    cterm=none
hi LineNr       guifg=#857b6f guibg=#000000 gui=none    ctermfg=241  ctermbg=0      cterm=none
hi StatusLine   guifg=#f6f3e8 guibg=#444444 gui=italic  ctermfg=254  ctermbg=238    cterm=none
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none    ctermfg=242  ctermbg=238    cterm=none
hi VertSplit    guifg=#444444 guibg=#444444 gui=none    ctermfg=238  ctermbg=238    cterm=none
hi Folded       guibg=#384048 guifg=#a0a8b0 gui=none    ctermfg=237  ctermbg=248    cterm=none
hi Title        guifg=#f6f3e8 guibg=none    gui=bold    ctermfg=230  ctermbg=none   cterm=none
hi Visual       guifg=#f6f3e8 guibg=#444444 gui=none    ctermfg=230  ctermbg=238    cterm=none
hi SpecialKey   guifg=#808080 guibg=#343434 gui=none    ctermfg=244  ctermbg=235    cterm=none

" Syntax highlighting
hi Comment      guifg=#99968b gui=italic    ctermfg=242     cterm=none
hi Todo         guifg=#8f8f8f gui=italic    ctermfg=102     cterm=none
hi Constant     guifg=#e5786d gui=none      ctermfg=174     cterm=none
hi String       guifg=#95e454 gui=italic    ctermfg=149     cterm=none
hi Identifier   guifg=#cae682 gui=none      ctermfg=150     cterm=none
hi Function     guifg=#cae682 gui=none      ctermfg=150     cterm=none
hi Type         guifg=#cae682 gui=none      ctermfg=150     cterm=none
hi Statement    guifg=#8ac6f2 gui=none      ctermfg=153     cterm=none
hi Keyword      guifg=#8ac6f2 gui=none      ctermfg=153     cterm=none
hi PreProc      guifg=#e5786d gui=none      ctermfg=174     cterm=none
hi Number       guifg=#e5786d gui=none      ctermfg=174     cterm=none
hi Special      guifg=#e7766a gui=none      ctermfg=174     cterm=none



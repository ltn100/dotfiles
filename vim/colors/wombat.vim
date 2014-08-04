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
  hi CursorLine     guibg=#2a2a2a ctermbg=235 cterm=NONE term=NONE
  hi CursorColumn   guibg=#2a2a2a ctermbg=235
  hi MatchParen     guifg=#ffff44 guibg=#3d3d1d gui=bold ctermfg=227 ctermbg=58
  hi Pmenu          guifg=#f6f3e8 guibg=#444444 ctermfg=230 ctermbg=238
  hi PmenuSel       guifg=#000000 guibg=#cae682 ctermfg=0   ctermbg=150

  hi TabLineFill    ctermbg=236   cterm=NONE
  hi TabLine        ctermfg=240  ctermbg=235   cterm=NONE
  hi TabLineSel     ctermfg=229  ctermbg=NONE   cterm=underline

  " Change cursor line in INSERT mode
  autocmd InsertLeave * hi CursorLine term=NONE cterm=NONE guibg=#2a2a2a ctermbg=235
  autocmd InsertEnter * hi CursorLine term=NONE cterm=NONE guibg=#3a2a2a ctermbg=236
endif

" General colors
hi Cursor       guifg=NONE    guibg=#656565 gui=NONE    ctermfg=NONE ctermbg=242    cterm=NONE
hi Normal       guifg=#f6f3e8 guibg=#242424 gui=NONE    ctermfg=255  ctermbg=234    cterm=NONE
hi NonText      guifg=#808080 guibg=#303030 gui=NONE    ctermfg=244  ctermbg=235    cterm=NONE
hi LineNr       guifg=#857b6f guibg=#000000 gui=NONE    ctermfg=241  ctermbg=0      cterm=NONE
hi StatusLine   guifg=#f6f3e8 guibg=#444444 gui=italic  ctermfg=254  ctermbg=238    cterm=NONE
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=NONE    ctermfg=242  ctermbg=238    cterm=NONE
hi VertSplit    guifg=#444444 guibg=#444444 gui=NONE    ctermfg=238  ctermbg=238    cterm=NONE
hi Folded       guibg=#384048 guifg=#a0a8b0 gui=NONE    ctermfg=237  ctermbg=248    cterm=NONE
hi Title        guifg=#f6f3e8 guibg=NONE    gui=bold    ctermfg=230  ctermbg=NONE   cterm=NONE
hi Visual       guifg=#f6f3e8 guibg=#444444 gui=NONE    ctermfg=230  ctermbg=238    cterm=NONE
hi SpecialKey   guifg=#808080 guibg=#343434 gui=NONE    ctermfg=244  ctermbg=235    cterm=NONE
hi Search       guibg=#ffff00 ctermbg=184

" Syntax highlighting
hi Comment      guifg=#99968b gui=italic    ctermfg=242     cterm=NONE
hi Todo         guifg=#8f8f8f gui=italic    ctermfg=102     cterm=NONE
hi Constant     guifg=#e5786d gui=NONE      ctermfg=174     cterm=NONE
hi String       guifg=#95e454 gui=italic    ctermfg=149     cterm=NONE
hi Identifier   guifg=#cae682 gui=NONE      ctermfg=150     cterm=NONE
hi Function     guifg=#cae682 gui=NONE      ctermfg=150     cterm=NONE
hi Type         guifg=#cae682 gui=NONE      ctermfg=150     cterm=NONE
hi Statement    guifg=#8ac6f2 gui=NONE      ctermfg=153     cterm=NONE
hi Keyword      guifg=#8ac6f2 gui=NONE      ctermfg=153     cterm=NONE
hi PreProc      guifg=#e5786d gui=NONE      ctermfg=174     cterm=NONE
hi Number       guifg=#e5786d gui=NONE      ctermfg=174     cterm=NONE
hi Special      guifg=#e7766a gui=NONE      ctermfg=174     cterm=NONE



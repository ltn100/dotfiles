" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set expandtab
set smartindent     " smart indent
" set autoindent      " always set autoindenting on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"set nobackup            " do not keep a backup file, use versions instead
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set background=dark
  hi statusline   term=NONE cterm=NONE ctermfg=yellow ctermbg=red
endif

set novisualbell    " turn off visual bell
set number          " show line numbers

:set viminfo='20,<50,s10,h,!

:map <M-Esc>[62~ <MouseDown>
:map! <M-Esc>[62~ <MouseDown>
:map <M-Esc>[63~ <MouseUp>
:map! <M-Esc>[63~ <MouseUp>
:map <M-Esc>[64~ <S-MouseDown>
:map! <M-Esc>[64~ <S-MouseDown>
:map <M-Esc>[65~ <S-MouseUp>
:map! <M-Esc>[65~ <S-MouseUp>
:set ttymouse=xterm2
:set mouse=a

set laststatus=2
set statusline=%<%m\ %f\ %y\ %{&ff}\ \%=\ row:%l\ of\ %L\ col:%c%V\ %P
"set statusline=Vim-%{Version()}\ %{getcwd()}\ \ %1*[%02n]%*\ %(%M%R%H%)\ %2*%F%*\ %=%{Options()}\ %3*<%l,%c%V>%*

" Dont move cursor back one character afer Escape
"inoremap <silent> <Esc> <C-O>:stopinsert<CR>

fu! Options()
"           let opt="Opt:"
            let opt=""
  " autoindent
" if &ai|   let opt=opt." ai"   |else|let opt=opt." noai"   |endif
  if &ai|   let opt=opt." ai"   |endif
  "  expandtab
" if &et|   let opt=opt." et"   |else|let opt=opt." noet"   |endif
  if &et|   let opt=opt." et"   |endif
  "  hlsearch
" if &hls|  let opt=opt." hls"  |else|let opt=opt." noet"   |endif
  if &hls|  let opt=opt." hls"  |endif
  "  paste
" if &paste|let opt=opt." paste"|else|let opt=opt." nopaste"|endif
  if &paste|let opt=opt." paste"|endif
  "  shiftwidth
  if &shiftwidth!=8|let opt=opt." sw=".&shiftwidth|endif
  "  textwidth - show always!
                    let opt=opt." tw=".&tw
"   let opt=opt."\[".&lines.",".&columns."\]"
  return opt
endf


fu! Version()
	return version
endf

:set t_Co=256
:colorscheme wombat

" Default session path
let g:PathToSessions = $HOME . "/.vim/sessions"

set nowrap

"if has("autocmd")
"	autocmd FileType python set complete+=k/home/climetdev/.vim isk+=.,(
"endif " has("autocmd")


highlight SpecialKey ctermfg=DarkGray
set listchars=tab:»-,trail:~
set list

let python_highlight_all=1
let sessionman_save_on_exit=1

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

autocmd BufNewFile,BufRead *.gui set syn=tcl


let g:showmarks_enable=0
let g:showmarks_textlower = "\t>"
let g:showmarks_textupper = "\t>"
let g:showmarks_textother = "\t>"

" a-z
hi ShowMarksHLl ctermfg=darkblue    ctermbg=lightgrey  guifg=#ff6666   guibg=#000000  gui=none

" A-Z
hi ShowMarksHLu ctermfg=green       ctermbg=lightgrey  guifg=#6666ff  guibg=#000000  gui=none

" others
hi ShowMarksHLo ctermfg=yellow      ctermbg=lightgrey  guifg=#666666   guibg=#000000  gui=none

" overlapping marks
hi ShowMarksHLm ctermfg=red         ctermbg=lightgrey  guifg=#ffff66   guibg=#000000  gui=none

" no marks
hi SignColumn   cterm=bold          ctermbg=none       guifg=#ffffff   guibg=#000000  gui=none


function! Toggle_showmarks_()
        if (&term =~ 'xterm' && !($COLORTERM == 'gnome-terminal'))
        \  || has('gui_running')
                if g:showmarks_enable == 0
                        set columns +=2
                else
                        set columns -=2
                endif
        endif
        ShowMarksToggle
endfunction

map <F4> :call Toggle_showmarks_()<CR>:sleep 50m <bar> echo 'showmarks ' . (g:showmarks_enable ? 'on' : 'off')<CR>
  " Toggle showmarks
  " (the sleep is so that showmarks' redrawing doesn't erase the message)

map <F3> :BufExplorer<CR>

:se cursorline
:hi CursorLine term=none cterm=none guibg=#2a2a2a
:autocmd InsertLeave * hi CursorLine term=none cterm=none guibg=#2a2a2a
:autocmd InsertEnter * hi CursorLine term=none cterm=none guibg=#3a2a2a

set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winpos,winsize

" Keep background windows open
set hidden

" Sort by name
let g:bufExplorerSortBy='name'


let g:EnhCommentifyTraditionalMode = 'no'
let g:EnhCommentifyFirstLineMode = 'no'
let g:EnhCommentifyUserBindings = 'no'
let g:EnhCommentifyUserMode = 'yes'


autocmd FileType python setlocal omnifunc=pysmell#Complete

set wildmenu
set wildmode=list:longest,full

"let twitvim_login = "ltn100:<pw>"

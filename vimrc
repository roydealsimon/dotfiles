set nocompatible    " No compatibility with VI. Must be FIRST.

" PLATFORMS:  ===================================================================

if has("win32") || has("win64")
    set shellslash " helps pathogen's duplication check (allegedly)
    set runtimepath+=$USERPROFILE/.vim
    set runtimepath+=$USERPROFILE/.vim/bundle/pathogen
else
    set runtimepath+=$HOME/.vim/Zipfiles/taglist
    set runtimepath+=$HOME/.vim/bundle/pathogen
end

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


if has("win32") || has("win64")
    source $VIMRUNTIME/mswin.vim
    behave mswin        " mouse should behave like a windows mouse
    set backupdir=$TEMP " Where to put backups
    set directory=$TEMP " Where to put swap file. In first dir if possible.
    set guifont=Lucida_Console:h9
else
    set backupdir=/tmp  " Where to put backups
    set directory=/tmp  " Where to put swap file. In first dir if possible.
    set guifont=Monaco:h18

    let shell=$SHELL  " Make sure Vim's aware of ZSH
    behave xterm      " mouse should behave like an X mouse
    " This is a list of directories which will be searched when using the
    " |gf|, [f, ]f, ^Wf, |:find| and other commands, provided that the file
    " being searched for has a relative path (not starting with '/')
    if has("mac") 
        set path=.,~/.vim,~/Desktop,~/Documents
    endif
endif

" Turn on syntax highlighting, but only if colors are available
if &t_Co > 2 || has("gui_running")
    syntax on
    set antialias
    set hlsearch
    set encoding=utf-8
    set lines=55
    set columns=125
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" THEMES: =-====================================================================

"colorscheme twilight
colorscheme solarized
set background=light

" OPTIONS: =====================================================================

"set patchmode=.orig    " Keep the original copy. Modifications will go to *.bak
"set textwidth=68       " 68 is good for emails -- see below
"set ttyscroll=0        " turn off scrolling
set autoindent          " Copy indent from current line when <CR> (ai)
set autowrite           " if file has been modified, save when leaving buffer, before :make etc.
set backspace=indent,eol,start
set backup              " Backups - leaves ~files all over
set backupext=.bak      " Replace ~ with .bak
set clipboard+=unnamed  " share windows clipboard
set expandtab           " get rid of tabs!
set fileformats=unix,dos " Gives EOL of current file that should be tried
set guioptions=ac
set helpheight=0        " 45 is max
set hidden              " Change buffer without having to save
set history=50
set ignorecase          " Ignore case in search if all lowercase...
set incsearch           " Match as we type
set infercase           " Case inferred by default
set iskeyword+=_,$,@,%,# " none of these are word dividers
set joinspaces          " Insert two spaces after a period with every joining of lines
set laststatus=2        " Tell VIM to always put a status line in, even if there is only one window
set lazyredraw          " Don't update the display while executing macros
set listchars=tab:▸\ ,eol:¬   " Use the same symbols as TextMate for tabstops and EOLs
set mousehide           " Hide the mouse pointer while typing
set noerrorbells
set noinsertmode        " Start in Insert mode?
set novisualbell
set number              " Line numbers
set ruler               " Show the line and column number of the cursor position
set sessionoptions+=resize     " restore size of vim window
set sessionoptions+=unix,slash " turn bs into fs + always save in unix format
set shiftwidth=4        " Number of spaces for indent (sw)
set showbreak=…         " Softwrapping characters: Ctrl-vu 2026
set showcmd             " Show command in modeline as we type
set showmatch           " Show the matching bracket for the last ')'
set showmode            " INSERT or NORMAL. Very nice.
set smartcase           " *-style searches should still be case-sensitive
set smartindent         " Autoindent when starting a new line.
set smarttab            " Tab/Backspace insert blanks according to shiftwidth.
set synmaxcol=2048      " Syntax coloring lines that are too long just slows down the world
set tabstop=4           " Number of spaces a <Tab> counts for (ts)
set title               " set terminal title to vim + filename
set titlestring=%t%(\ %M%)%(\ [%{expand(\"%:p:h\")}]%)%(\ %a%)
set ttyfast             " Change if on a fast terminal for smoother changes.
set wildmenu            " Make the command-line completion better
set wrapscan            " Start searches over once we reach the end (on by default)
set splitbelow          " Split horizontal windows below the current window.
set splitright          " Split vertical windows to the right of the current window.

"if has("netbeans_intg") || has ("sun_workshop")
"    set autochdir       " always switch to the current file directory
"endif

" STATUSLINE:
" Left Side...
set statusline=%<[%n]    " buffer number
set statusline+=\ %t     " filename (tail), F for full path
set statusline+=\ %m     " modified flag [+/-]
set statusline+=%r       " readonly flag [RO]
set statusline+=%h       " help buffer flag [help]
set statusline+=%w       " preview window flag [Preview]
set statusline+=\ %{fugitive#statusline()} " git status
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Right Side...
"set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''} " RVM
set statusline+=%=
set statusline+=%c       " column number
set statusline+=%V       " virtual column number as -{num} if not same as column number
"set statusline+=,\%l/%L  " line number/number of lines in buffer
set statusline+=,\%l     " line number/number of lines in buffer
set statusline+=\ %a     " argument list status as in default title, empty if zero
"set statusline+=\ 0x%0B  " value of byte under cursor in hex
set statusline+=\ %p%%   " percentage through file in lines
"set statusline+=\ \[%{&encoding}\,%{&fileformat}\,%{strlen(&ft)?&ft:'none'}] " filetype/encoding/fileformat
set statusline+=\ \[%{&encoding}\,%{strlen(&ft)?&ft:'none'}] " filetype/encoding/fileformat

" Syntactic
"  %e - number of errors
"  %w - number of warnings
"  %t - total number of warnings and errors
"  %fe - line number of first error
"  %fw - line number of first warning
"  %F - line number of first warning or error
" Several additional flags are available to hide text under certain conditions:
"     %E{...} - hide the text in the brackets unless there are errors
"     %W{...} - hide the text in the brackets unless there are warnings
"     %B{...} - hide the text in the brackets unless there are both warnings AND
"               errors
let g:syntastic_stl_format='[%E{Error: L%fe #%e}%B{, }%W{Warning: L%fw #%w}]'
let g:syntastic_auto_jump=1

" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
 
" Ignore Suffixes: when using the :edit command
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.tbz,.bz2,.class,.my

" Ignore Completion:
" A file that matches with one of these
" patterns is ignored when completing file or directory names.
set wildignore+=*.swp,*.swo,*.bak,*~,*.o,*.dbg,*.class,*.my

 
" Messages:
"  o: overwrite message for writing a file with subsequent message
"     for reading a file (useful for ":wn" or when 'autowrite' on)
"  O: message for reading a file overwrites any previous message.
"     Also for quickfix message (e.g., ":cn").
"  s: Don't give "search hit BOTTOM, continuing at TOP" or "search
"     hit TOP, continuing at BOTTOM" messages
"  t: Truncate file message at the start if it is too long to fit
"     on the command-line, "<" will appear in the left most column.
"     Ignored in Ex mode.
"  T: Truncate other messages in the middle if they are too long to
"     fit on the command line. "..." will appear in the middle.
"     Ignored in Ex mode.
"  W: Don't give "written" or "[w]" when writing a file
"  A: Don't give the "ATTENTION" message when an existing swap file
"     is found.
"  I: Don't give the intro message when starting Vim |:intro|.
set shortmess=a     " No hit enter to continue. *groan*

" Diff Options:
"  - show filler lines
"  - use a context of 512 lines
"  - ignore white space changes
if version >= 600
    set diffopt=filler,context:512,iwhite
endif

" Format Options:
"t Automatically wrap text.
"c Automatically wrap comments. Insert the comment leader automatically.
"r Insert comment leader in a comment when a new line is inserted.
"o Insert comment leader in a comment when a new line is created using the O and
"  o command.
"q Allow gq  to format comments.
"2 Format based on the indent of the second line, not the first.
"v Do old-style Vi text wrapping.Wrap only on blanks that you enter.
"b Wrap only on blanks you type, but only if they occur before "textwidth".
"l Do not break line in insert mode. Only let gq break the lines.
set formatoptions=tcql

set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"             | | | | | | | | |
"             | | | | | | | | +-- "]" Insert and Replace
"             | | | | | | | +-- "[" Insert and Replace
"             | | | | | | +-- "~" Normal
"             | | | | | +-- <Right> Normal and Visual
"             | | | | +-- <Left> Normal and Visual
"             | | | +-- "l" Normal and Visual (not recommended)
"             | | +-- "h" Normal and Visual (not recommended)
"             | +-- <Space> Normal and Visual
"             +-- <BS> Normal and Visual



" PasteToggle: (sane indentation on pastes) just press F12 when you are
" going to paste several lines of text so they won't be indented.
" When in paste mode, everything is inserted literally.
"set pastetoggle=<F12>



if has("autocmd")
    filetype on
    filetype plugin on
    filetype indent on

    " Syntax of these languages is fussy over tabs Vs spaces
"    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
"    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    
    autocmd FileType ruby,haml,eruby,yaml,html,css,javascript,sass,cucumber,rspec set ai sw=2 sts=2 et
    " Customisations based on house-style (arbitrary)
"     autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
"     autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
"     autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    
    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml

    " Mutt
"    autocmd BufRead  mutt*[0-9]         set tw=68
"    autocmd BufRead  mutt*[0-9]         set formatoptions=cqrt

    " Automatically chmod +x shell scripts
    autocmd BufWritePost   *.sh      !chmod +x %

    " When vimrc is edited, reload it
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Remap ctrl-] to Enter and ctrl-T to esc to make help sane.
    au filetype help :nnoremap <buffer><CR> <c-]>
    au filetype help :nnoremap <buffer><BS> <c-T>

    " Strip trailing whitespace
    autocmd BufWritePre *.py,*.js,*.rb :call <SID>StripTrailingWhitespaces()
    

    augroup filetypedetect
        if has("unix")
            au BufNewFile,BufRead /$USER/.shell/*      setf zsh
        endif
    augroup END

    " Start up NERDTree and focus cursor in the new document
"    autocmd VimEnter * NERDTree
"    autocmd VimEnter * wincmd p

    " .. opens the parent tree in fugitive's Gedit
    autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
    
    " Delete fugitive's buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete

    " When editing a file, always jump to the last known cursor
    " position. Don't do it when the position is invalid or when inside
    " an event handler (happens when dropping a file on gvim).
    " ROY: do NOT change 0 to 1 - it breaks Rails.vim
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" |

    " Automatic fold settings for specific files. Uncomment to use.
    " autocmd FileType ruby setlocal foldmethod=syntax
    " autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

    " For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
    "autocmd BufNewFile,BufRead *_spec.rb compiler rspec
endif


" SHORTCUTS: ===================================================================

let mapleader=','
let g:mapleader=',' " Leader Chars: b*,c*,e*,h,i,j,k,l,m*,n,p,s,v,w

nmap <leader>1 :colorscheme rds1<CR>:set background=dark<CR>
nmap <leader>2 :colorscheme rds2<CR>:set background=dark<CR>
nmap <leader>3 :colorscheme rds3<CR>:set background=dark<CR>
nmap <leader>4 :colorscheme peaksea<CR>:set background=dark<CR>
nmap <leader>5 :colorscheme twilight<CR>:set background=dark<CR>
nmap <leader>6 :colorscheme ir_black_rds<CR>:set background=dark<CR>
nmap <leader>9 :colorscheme solarized<CR>:set background=dark<CR>
nmap <leader>0 :colorscheme solarized<CR>:set background=light<CR>

" Edit the vimrc file
nmap <leader>ee :tabedit $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" Command-T for buffers doesn't work out of the box, so set it explicitly
nmap <silent> <Leader>B :CommandTBuffer<CR>

" Build Ruby Tags
"map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log --exclude=tags -f tmp/tags -R * `rvm gemdir`/gems/*<CR><CR>
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>

" Remove the search highlight
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Shortcut to rapidly toggle `set list`
nmap <leader>i :set list!<CR>

" Open in Chrome
nmap <leader>f :! open -a "Google Chrome.app" %:p<CR>

" kill trailing whitespace
"nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
"nnoremap <silent> <leader>w :call <SID>StripTrailingWhitespaces()<CR>

" hitting D will duplicate whatever’s selected directly below.
vmap D y'>p
noremap Y y$
"nnoremap <Space> :
noremap <space> za     " space opens folds

"set foldcolumn=1 " column indicating fold levels

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Vertical and horizontal split then hop to a new buffer
:noremap <silent><Leader>v :vsp^M^W^W<cr>
:noremap <silent><Leader>s :split^M^W^W<cr>

" Buffer Mappings
if has("win32") || has("win64")
    noremap <M-k> :bp<CR>
    noremap <M-j> :bn<CR>
    noremap <M-h> :tn<CR>
    noremap <M-l> :tp<CR>
else
    noremap <D-k> :bp<CR>
    noremap <D-j> :bn<CR>
    noremap <D-h> :tn<CR>
    noremap <D-l> :tp<CR>
end

" =NAVIGATION
" Move between windows with ctrl + movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Close windows with ,c
noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
noremap <silent> <leader>cl :wincmd l<CR>:close<CR>
noremap <silent> <leader>cc :close<CR>

" Closes quick window
noremap <silent> <leader>cw :cclose<CR>

" Resize window
map <D-Up>    <C-W>-
map <D-Down>  <C-W>+
map <D-Left>  <C-W>>
map <D-Right> <C-W><

" noremap <silent> ,sb :wincmd p<CR>
" noremap <silent> <C-F9>  :vertical resize -10<CR>
" noremap <silent> <C-F10> :resize +10<CR>
" noremap <silent> <C-F11> :resize -10<CR>
" noremap <silent> <C-F12> :vertical resize +10<CR>
" noremap <silent> ,s8 :vertical resize 83<CR>

" MAPPINGS TAKEN
" Moves this window to the left, center, or right side of my monitor.
" nmap ,mh   :winpos 0 0<cr>
" nmap ,ml   :winpos 546 0<cr>
" nmap ,mr   :winpos 1092 0<cr>
" " Starts a new GVim window.
" nmap ,mn :!start gvim<cr>


" Move text around
imap <S-Up>    <Esc>:m-2<CR>gi
imap <S-Down>  <Esc>:m+<CR>gi
nmap <S-Up>    mz:m-2<CR>`z
nmap <S-Down>  mz:m+<CR>`z
vmap <S-Up>    :m'<-2<CR>gv
vmap <S-Down>  :m'>+<CR>gv
vmap <S-Left>  :<<CR>gv
vmap <S-Right> :><CR>gv



" Make cursor move by visual lines instead of file lines (when wrapping)
map  <up>   gk
map  k      gk
imap <up>   <C-o>gk
map  <down> gj
map  j      gj
imap <down> <C-o>gj
map  E      ge

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tm :tabmove<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>

if has("mac")
    " For mac users (using the 'apple' key)
    map <D-S-]> gt
    map <D-S-[> gT
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
else 
    " for linux and windows users (using the control key)
    map <C-S-]> gt
    map <C-S-[> gT
    map <C-1> 1gt
    map <C-2> 2gt
    map <C-3> 3gt
    map <C-4> 4gt
    map <C-5> 5gt
    map <C-6> 6gt
    map <C-7> 7gt
    map <C-8> 8gt
    map <C-9> 9gt
    map <C-0> :tablast<CR>
end

" TODO: VimCast: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" if exists(":Tabularize")
"   nmap <Leader>x= :Tabularize /=<CR>
"   vmap <Leader>x= :Tabularize /=<CR>
"   nmap <Leader>x| :Tabularize /|<CR>
"   vmap <Leader>x| :Tabularize /|<CR>
"   nmap <Leader>x: :Tabularize /:\zs<CR>
"   vmap <Leader>x: :Tabularize /:\zs<CR>
" endif
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" C-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" A-] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" Insert New Line
map <S-Enter> O<ESC> " inserts new line without going into insert mode
map <Enter> o<ESC>

" Highlight all instances of the current word under the cursor
nmap <silent> <F5> :setl hls<CR>:let @/="<C-r><C-w>"<CR>

nnoremap <silent> <F6> :GundoToggle<CR>

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>

" Delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>
nmap <silent> <leader>bo :Bonly<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
if has("unix")
    map <leader>er :e    <C-R>=expand("%:p:h") . "/" <CR>
    map <leader>es :sp   <C-R>=expand("%:p:h") . "/" <CR>
    map <leader>ev :vsp  <C-R>=expand("%:p:h") . "/" <CR>
    map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
else
    map <leader>er :e    <C-R>=expand("%:p:h") . "\\" <CR>
    map <leader>es :sp   <C-R>=expand("%:p:h") . "\\" <CR>
    map <leader>ev :vsp  <C-R>=expand("%:p:h") . "\\" <CR>
    map <leader>et :tabe <C-R>=expand("%:p:h") . "\\" <CR>
endif

 
" FORMAT PARAGRAPH:
" Formatting the current paragraph according to
" the current 'textwidth' with ^J (control-j):
"imap <C-J> <c-o>gqap
"nmap <C-J>      gqap
"vmap <C-J>      gq

" VISUAL MODE:
" MS Windows-style 'indent/dedent selection'
"vmap <Tab> >
"vmap <S-Tab> <

" Textmate Style Indentation:
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv


" FUNCTION KEYS:
map      <silent><F1>   <ESC>:exec          "help".expand("<cWORD>")<CR> " F1 help for word under cursor
nnoremap <silent><F2>   :TlistToggle<CR>
nmap     <silent><F3>   :NERDTreeToggle<CR>
nmap     <silent><S-F3> :NERDTree<CR>


" ABBREVIATIONS: =============================================================

iab #d #define
iab #i #include
iab #b /************************************************
iab #e ************************************************/
iab #l /*----------------------------------------------*/

iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab isodate <c-r>=strftime("%Y-%m-%d")<cr>
iab usdate <c-r>=strftime("%m-%d-%Y")<cr>
iab eudate <c-r>=strftime("%d-%m-%Y")<cr>
iab nowdate <c-r>=strftime("%H:%M:%S")<cr>

"iab Lorem Lorem ipsum dolor sit amet,consectetur adipisicing elit,sed do eiusmod tempor incididunt utlabore etdolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi utaliquip exeacommodo consequat. Duis aute irure dolor inreprehenderit involuptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,sunt inculpa qui officia deserunt mollit anim id est laborum

"iab debug require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] =1; Debugger.settings[:autolist] =1; debugger



" PLUGINS: ===================================================================

" Match It: smart %-jumps for conditionals and such.
runtime macros/matchit.vim   

" FUGITIVE: Gcommit, Gremove, Gmove, Gwrite, Gread
nmap <leader>gb :Gblame<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>ge :Gedit HEAD<CR>
nmap <leader>gg :Ggrep<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gs :Gstatus<CR>

" ALTERNATIVE: switch between header and source files
nmap <leader>aa :A<CR>
nmap <leader>as :AS<CR>
nmap <leader>av :AV<CR>
nmap <leader>at :AT<CR>

" ACK:
nmap <leader>ak :Ack<CR>
nmap <leader>af :AckFile<CR>
nmap <leader>ad :AckAdd<CR>

" CSCOPE:
" if has('cscope')
"   set cscopetag cscopeverbose
" 
" "  set csprg=~/bin/cscope
"   set csto=0
"   set cst
"   set nocsverb
"   " add any database in current directory
"   if filereadable("cscope.out")
"       cs add cscope.out
"       " else add database pointed to by environment
"   elseif $CSCOPE_DB != ""
"       cs add $CSCOPE_DB
"   endif
"   
"   if has('quickfix')
"     set cscopequickfix=s-,c-,d-,i-,t-,e-
"   endif
" 
"     cnoreabbrev <expr> csa
"           \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
"     cnoreabbrev <expr> csf
"           \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
"     cnoreabbrev <expr> csk
"           \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
"     cnoreabbrev <expr> csr
"           \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
"     cnoreabbrev <expr> css
"           \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
"     cnoreabbrev <expr> csh
"           \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')
" 
"     command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src 
" end

" CONQUE:
if has("unix")
    nmap <leader>co :ConqueTerm
    nmap <leader>ct :ConqueTermTab
    nmap <leader>cs :ConqueTermSplit
end


let g:LustyJugglerSuppressRubyWarning = 1
let g:showmarks_enable = 0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

let g:rails_menu=1
let g:rails_ctags_arguments="--extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* "
let g:rails_url='http://cornucopia.dev/admin'

let g:ackprg="ack -H --nocolor --nogroup --column --ignore-dir=log --ignore-dir=tmp"

" SuperTab conflicts with vim-endwise
"let g:SuperTabCrMapping = 0
"let SuperTabMappingForward = '<C-Space>' 
" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"
 
let g:surround_45 = "<% \r %>"   " - wraps in <% %>
let g:surround_61 = "<%= \r %>"  " = wraps in <%= %>

"let g:showmarks_enable=1

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
"let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks" " Store the bookmarks file locally

let NERDTreeMouseMode=1 " Single click for everything
"let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1 " Show the bookmarks table on startup
"let NERDChristmasTree=1
let NERDTreeChDirMode=2
"let NERDTreeQuitOnOpen=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]


"-----------------------------------------------------------------------------
" CPPOmniCompletion:
"-----------------------------------------------------------------------------

let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_MayCompleteArrow    = 1 " autocomplete after ->
let OmniCpp_MayCompleteDot      = 1 " autocomplete after .
let OmniCpp_MayCompleteScope    = 1 " autocomplete after ::
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_SelectFirstItem     = 2 " select first item (but don't insert)
let OmniCpp_ShowAccess          = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters

" Let the syntax highlighting for Java files allow cpp keywords
let java_allow_cpp_keywords = 1


autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
highlight PMenu gui=bold guibg=#CECECE guifg=#444444

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


"improve autocomplete menu color
"highlight Pmenu ctermbg=238 gui=bold
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f gl /usr/include/GL/   # for OpenGL
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f sdl /usr/include/SDL/ # for SDL
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f qt4 /usr/include/qt4/ # for QT4

" Mac OSX: remove /usr/bin/tags. Native version doesn't support -R flag
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
set tags+=./tags
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/systags

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set completeopt=menu " menuone,menu,longest,preview

" complete with control+space
"imap <C-Space> <C-x><C-o>

" C-SUPPORT
let g:C_SourceCodeExtensions  = 'c cc cp cxx cpp CPP c++ C i ii'

" RUBY-COMPLETION
"   if has("autocmd") && exists("+omnifunc")
"	autocmd Filetype *
"		    \	if &omnifunc == "" |
"		    \		setlocal omnifunc=syntaxcomplete#Complete |
"		    \	endif
"    endif

" FUNCTIONS: ==========================================================

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction


" VimCast: Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" TODO: Align | as you type (useful for Cucumber): https://gist.github.com/287147
" function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"     Tabularize/|/l1
"     normal! 0
"     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction


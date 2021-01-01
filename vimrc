set nocompatible              " be iMproved, required
filetype off                  " required

" ########################################################################
" ############################  Vim Settings #############################
" ########################################################################

" Python Provider
let g:python_host_prog = '/Users/bbraunj/.anaconda3/bin/python'
let g:python3_host_prog = '/Users/bbraunj/.anaconda3/bin/python3'

" --------- Indentation ---------
set tabstop=4
set softtabstop=4
set shiftwidth=4

" PEP Indentation
au BufNewFile,BufRead *.py
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.tex
    \ set textwidth=79

" ----------- Colors ------------
let python_highlight_all=1
syntax on
colorscheme zenburn

" ------- Other Settings --------
" Backspace adjustments
set backspace=indent,eol,start

" Better pasting from system clipboard
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"

" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set encoding=utf-8
set number

" Native fuzzy finding
set path+=**
set wildmenu

" vv to generate new vertical split
nnoremap <silent> v\| <C-w>v

" vh to generate new horizontal split
nnoremap <silent> v- :split<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Insert PUDB Breakpoint
nnoremap <Leader>q o <BS>import pudb; pudb.set_trace()<ESC>

" Highlight current line
set cursorline

" Persistent Undo
if has('persistent_undo')       "check if your vim version supports it
    set undofile                 "turn on the feature  
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif 

" Mouse mode
set mouse=a

" Yank to system clipboard with gy. Put wiht gp.
nnoremap gy "+y
vnoremap gy "+y
nnoremap gP "+P
vnoremap gP "+P
nnoremap gp "+p
vnoremap gp "+p

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ########################################################################
" #####################   Vim-Plug Plugin Settings #######################
" ########################################################################

" Vim-Plug
call plug#begin('~/.vim/plugged')

" ------------------------------------------------
" ------------------ Utility ---------------------
" ------------------------------------------------

" ----- Commentary -----
Plug 'tpope/vim-commentary'

" ----- NERDTree -----
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ----------- Syntax -----------
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3

" Show marks in number bar
Plug 'kshenoy/vim-signature'

" ------------ Git ------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-unimpaired'

" ------- Quick Finding -------
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <leader>. :CtrlPTag<cr>

Plug 'wsdjeg/FlyGrep.vim'
nnoremap <Leader>s :FlyGrep<cr>

" ------- Other Plugins -------
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Swap windows (<Leader>ww in 1st window then same in next)
Plug 'wesQ3/vim-windowswap'

" Show items in buffer (<Leader>b)
Plug 'jeetsukumaran/vim-buffergator'

" Random other useful plugins
Plug 'tmhedberg/SimpylFold'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'vim-scripts/TaskList.vim'

" Refactoring
vmap \em :call ExtractMethod()<CR>
function! ExtractMethod() range
  let name = inputdialog("Name of new method:")
  '<
  exe "normal! O\<BS>def " . name .":\<CR>\<Esc>"
  '>
  exe "normal! oreturn ;\<CR>\<Esc>k"
  s/return/\/\/ return/ge
  normal! j%
  normal! kf(
  exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
  normal! ==
  normal! j0w
endfunction

Plug 'majutsushi/tagbar'
" nnoremap <silent> <C-M> :TagbarToggle<CR>
" Plug 'liuchengxu/vista.vim'
" let g:vista_default_executive = 'vim_lsp'
" nnoremap <silent> <C-M> :Vista!!<CR>

" Preview plugins
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" autocmd Filetype tex setl updatetime=1
" let g:livepreview_previewer = 'open -a Skim'

Plug 'lervag/vimtex'
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'skim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
nmap <leader>md <Plug>MarkdownPreviewToggle

" ------------------------------------------------
" ------------------- Visual ---------------------
" ------------------------------------------------

" Info bar at bottom & top of Vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='zenburn'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Show icons for files in NERDTree
Plug 'ryanoasis/vim-devicons'

" Better syntax highlighting for C++
Plug 'octol/vim-cpp-enhanced-highlight'

" ------------------------------------------------
" --------------- Python Plugins -----------------
" ------------------------------------------------
Plug 'python/black'
Plug 'vim-scripts/indentpython.vim'
Plug 'SkyLeach/pudb.vim'

" -------------------------------------------------
" --------------- Vim/Tmux Plugins ----------------
" -------------------------------------------------
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

Plug 'wellle/tmux-complete.vim'

Plug 'benmills/vimux'
Plug 'janko/vim-test'
let test#strategy = "vimux"
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>tv :TestVisit<CR>

" ===========================================================================
" ======================== Autocomplete using ncm2 ==========================
" ===========================================================================
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Buffer completion
" -----------------
" Current buffer
Plug 'ncm2/ncm2-bufword'
" Other buffers
Plug 'fgrsnau/ncm-otherbuf'

" Directories/Files completion
" ----------------------------
Plug 'ncm2/ncm2-path'

" Python completion
" -----------------
Plug 'ncm2/ncm2-jedi'

" Ultisnips completion
" --------------------
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger		= "<c-j>"

" Spell check completion
" ----------------------
Plug 'fgrsnau/ncm2-aspell'
Plug 'filipekiss/ncm2-look.vim'

" Vimtex
" ------
augroup my_cm_setup
autocmd!
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd Filetype tex call ncm2#register_source({
		\ 'name': 'vimtex',
		\ 'priority': 8,
		\ 'scope': ['tex'],
		\ 'mark': 'tex',
		\ 'word_pattern': '\w+',
		\ 'complete_pattern': g:vimtex#re#ncm2,
		\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
		\ })
augroup END

" ---------------------------------------------------------------------------
" --------------------- LSP (Language Server Protocol) ----------------------
" ---------------------------------------------------------------------------
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2-vim-lsp'

" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#vimtex#get_source_options{
"     \ 'name' : 'vimtex',
"     \ 'priority': 8,
"     \ 'whitelist': ['tex'],
"     \ 'completor': function('vimtex#complete#omnifunc'),
"     \ })

" ===========
"   Python
" ===========
" Plug 'davidhalter/jedi-vim'
" let g:jedi#show_call_signatures = 0

" if executable('pyls')
" 	au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif
"         " \ 'workspace_config': {'pyls': {'plugins': {'pycodestyle': {'enabled': v:false}}}}

" =====================
"	C/C++/Objective-C
" =====================
Plug 'pdavydov108/vim-lsp-cquery'
if executable('cquery')
	au User lsp_setup call lsp#register_server({
	      \ 'name': 'cquery',
	      \ 'cmd': {server_info->['cquery']},
	      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
	      \ 'initialization_options': { 'cacheDirectory': '/path/to/cquery/cache'  },
	      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
	      \ })
endif
" ---------------------------------------------------------------------------
" ---------------------------------------------------------------------------

call plug#end()

set number
set relativenumber
set autoindent
set tabstop=4
set smarttab
set shiftwidth=4
set softtabstop=4
set mouse=a
set foldlevel=99
set guicursor=n-c-v-i:ver25
set nohlsearch
set noswapfile
set scrolloff=8
set updatetime=50

call plug#begin()

Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'https://github.com/frazrepo/vim-rainbow'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/mileszs/ack.vim'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
" Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/shime/vim-livedown', {'do': 'npm install -g livedown'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'https://github.com/rhysd/vim-clang-format', {'do': 'apt install clang-format'}
Plug 'https://github.com/pseewald/vim-anyfold'
Plug 'https://github.com/nestorsalceda/vim-strip-trailing-whitespaces'
" Plug 'https://github.com/Pocco81/AutoSave.nvim'

call plug#end()

" AutoFolds
autocmd Filetype * AnyFoldActivate

" Sets curson to vertical on exit
autocmd VimLeave * set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20

" Vim colorscheme
" To have bg transparent, add into .local/share/nvim/plugged/vim/colors/dracula.vim
" let s:bg=''
colorscheme dracula

" Vim Airline Theme
let g:airline_theme='dracula'

" NERDTree show hidden
let NERDTreeShowHidden=1

" NERDTree reload files
autocmd BufEnter NERD_tree_* | execute 'normal R'

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start tagbar
" autocmd VimEnter * Tagbar

" Start Rainbow
let g:rainbow_active = 1

" Start AG
let g:ackprg = 'ag --nogroup --nocolor --column'

" Remaps
nmap <F2> zM
nmap <F3> zR
nmap <F4> :LivedownToggle<CR>
nmap <F5> gg=G``
nmap <F6> <Plug>(coc-fix-current)
nmap <F7> :NERDTreeFocus<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <S-s> :wa<CR>
nnoremap <C-s> :wqa<CR>
nnoremap <C-f> :Ack<Space>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc Snippets next occurrence
let g:UltiSnipsJumpForwardTrigger="<C-j>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1):
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction


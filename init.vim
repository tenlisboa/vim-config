call plug#begin('~/.config/nvim/plugins')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-haml'
Plug 'moll/vim-node'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'skywind3000/asyncrun.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax on
color dracula

"----------------------------------------- CONFIG "
set softtabstop=2
set shiftwidth=2
set expandtab
let mapleader = ','
set autowriteall
set number
set updatetime=100
"----------------------------------------- SEARCH "
set hlsearch
set incsearch

"----------------------------------------- SPLIT MAPPING "

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

"------------------------------------------ MAPPINGS "

" Make NERDTree easier to toggle "
nmap <C-b> :NERDTreeToggle<cr>

" Make it easy to edit vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Edit snippets "
nmap <Leader>es :e $MYVIMRC/snippets/<cr>
" Add simple highlight removal "
nmap <Leader><space> :nohlsearch<cr>

" Ctags find a single tag "
nmap <Leader>f :tag<space>
nmap <Leader>fl :ts<space>
" Generate Ctags "
nmap <Leader>cg :!ctags -R --exclude=.git --exclude=vendor --exclude=node_modules<cr>

"--------------------------------------------- PLUGINS "
"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
" CMD + P for MAC "
nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
" For Linux "
nmap <C-e> :CtrlPMRUFiles<cr>
nmap <C-r> :CtrlPBufTag<cr>

"/
"/ Ale
"/
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
"let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fix_on_save = 1

"/
"/ Greplace.vim
"/
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ Emmet VIM
"/
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

"/
"/ Vim-Snippets
"/
let g:UltiSnipsExpandTrigger="<tab>"

"/
"/ AUTO close tags
"/
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.  "
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.blade.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.  "
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.jsx,*vue,*.blade.php'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.  "
let g:closetag_filetypes = 'html,xhtml,phtml,vue,php'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.  "
let g:closetag_xhtml_filetypes = 'xhtml,jsx,vue,php'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.) "
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype) "
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>' "
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''"
let g:closetag_close_shortcut = '<leader>>'


"--------------------------------------------- AUTO COMMANDS "

" Automaticaly souce the Vimrc file on save "
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source %
augroup END

" Remove whitespaces "
autocmd BufWritePre * %s/\s\+$//e

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

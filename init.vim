" @author: REI

" Basic setting

" reset <LEADER>
let mapleader=" "

" support syntax hightlight
syntax on

" left lines below
set scrolloff=9

" show relative line number
set relativenumber

" set <tab>
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set fileencoding=utf-8
set nofoldenable
set completeopt=noinsert
set smartindent
set backspace=indent,eol,start
set nocompatible
set number
set cursorline
set wrap
set showcmd
set wildmenu
" highlight search result
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=""

set foldmethod=syntax

" Key Mapper

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
au Filetype cpp inoremap { {<CR>}<ESC>i
inoremap { {}<ESC>i

map S  : w<CR>
map Q  : q<CR>
map R  : source $MYVIMRC<CR>
map s  : <nop><CR>
map sd : set splitright<CR>   : vsplit<CR>
map sa : set nosplitright<CR> : vsplit<CR>
map <LEADER><RIGHT> <C-w>l
map <LEADER><LEFT> <C-w>h
map <LEADER><DOWN> <C-w>j
map <LEADER><UP> <C-w>k
map == $
map -- 0
map O  : vertical resize-5<CR>
map P  : vertical resize+5<CR>
map tu : tabe<CR>
map tn : tabnext<CR>
map tb : -tabnext<CR>
map tp: noh<CR>

" Plugs
call plug#begin('~/.vim/plugged')

" themes
Plug 'franbach/miramare'
" beautify
Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" additional functions
Plug 'godlygeek/tabular'                                                  " text aligning
Plug 'scrooloose/nerdtree'                                                " file catalog
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'SirVer/ultisnips'                                                   " complete snips
"Plug 'honza/vim-snippets'
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdcommenter'												" quickly  (un)comment
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'

Plug 'tpope/vim-surround'
"python
Plug 'lilydjwg/colorizer'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
call plug#end()
" Reopen
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

lua require("toggleterm").setup()
tnoremap <Esc> <C-\><C-n>

" the configuration options should be placed before `colorscheme miramare`
set termguicolors
let g:miramare_enable_italic = 1
let g:miramare_disable_italic_comment = 1
colorscheme miramare

"plug - undotree
nnoremap <LEADER>u :UndotreeToggle<CR>
"set background=dark
let g:python3_host_prog = '/home/zelin/anaconda3/bin/python3'
" python setting
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=0
au Filetype python set expandtab
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

" plug - nerdtree
nnoremap <TAB> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeWinSize=32
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1

" plug - rainbow
let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" plug - ultisnips
"设置tab键为触发键
let g:UltiSnipsExpandTrigger = '<c-j>'
"设置向后跳转键
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
"设置向前跳转键
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'
"设置打开配置文件时为垂直打开
let g:UltiSnipsEditSplit="vertical"

" plug - indent guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
":nmap <slient> <Leader>i <Plug>IndentGuidesToggle

" Plug - TagBar
nmap <S-Tab> :TagbarToggle<CR>
let g:tagbar_compact=1

" 持久化 undo redo
set undofile
set undodir=~/.vim/undo

"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" plug - Coc

let g:coc_global_extensions = ['coc-pyright', 'coc-marketplace', 'coc-snippets']

" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Fzf
map <leader>f :Files<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" Format json
command! Jsonf :execute '%!jq .'
command! Pf :execute 'CocCommand prettier.formatFile'

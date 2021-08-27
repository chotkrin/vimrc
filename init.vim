" @author: KoyomiKun

" Basic setting

" reset <LEADER>
let mapleader=" "

" support syntax hightlight
syntax on

" left 5 lines below
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
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

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
map tp : r !scs.sh -s /home/komikun/Pictures/screenshoots/<CR>

noremap <PAGEUP> 20k
noremap <PAGEDOWN> 20j


" Plugs
call plug#begin('~/.vim/plugged')

" themes
"Plug 'ajmwagar/vim-deus'
"Plug 'morhetz/gruvbox'
"Plug 'connorholyday/vim-snazzy'
Plug 'franbach/miramare'



" beautify
Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'vim-airline/vim-airline-themes'


" additional functions
Plug 'godlygeek/tabular'                                                  " text aligning
Plug 'scrooloose/nerdtree'                                                " file catalog
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Valloric/YouCompleteMe'                                             " auto complete
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " preview markdown
Plug 'mzlogin/vim-markdown-toc'                                           " highlight markdown
Plug 'SirVer/ultisnips'                                                   " complete snips
Plug 'honza/vim-snippets'
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdcommenter'												" quickly  (un)comment
Plug 'Chiel92/vim-autoformat'
"Plug 'w0rp/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode', {'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh'}


Plug 'tpope/vim-surround'
"python
"jupyter
Plug 'hisaknown/jupyterkernel.vim'
Plug 'diepm/vim-rest-console'
Plug 'lilydjwg/colorizer'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
call plug#end()
" Reopen
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"plug - undotree

nnoremap <LEADER>u :UndotreeToggle<CR>
" plug - snazzy
colorscheme miramare
"set background=dark
let g:python3_host_prog = '/usr/local/bin/python3'
" python setting
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
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

" compile and run
map <F5> :call CompileRunGcc()<CR>
"func! CompileRunGcc()
	"exec "w"
	"if &filetype == 'c'
		"exec "!g++ % -o %<"
		"exec "!time ./%<"
	"elseif &filetype == 'cpp'
		"set splitbelow
		"exec "!g++ -std=c++11 % -Wall -o %<"
		":sp
		":term ./%<
	"elseif &filetype == 'java'
		"exec "!javac %"
		"exec "!time java %<"
	"elseif &filetype == 'sh'
		":!time bash %
	"elseif &filetype == 'python'
		""exec  "!clear"
		""exec  "!time python3 %"
		"exec "set splitbelow"
		"exec ":term python3 %"
	"elseif &filetype == 'html'
		"exec "!chromium % &"
	"elseif &filetype == 'go'
		""exec "!clear"
		""exec ":GoRun"
		"exec "set splitbelow"
		
		"exec ":term go run %"
	"elseif &filetype == 'scala'
		"exec "!scalac %"
		"exec "!time scala %<"
	"endif
"endfunc
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:term ./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


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

" plug - ALE
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" 触发/关闭语法检查
nmap <Leader>at :ALEToggle<CR>
" 查看错误或警告的详细信息
nmap <Leader>ad :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
			\   'c++': ['clang'],
			\   'c': ['clang'],
			\   'python': ['pylint'],
			\}
" }}}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1


" plug - YouCompleteMe
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,java,python,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
highlight PMenu ctermfg=0 ctermbg=255 guifg=black guibg=Grey93
highlight PMenuSel ctermfg=255 ctermbg=0 guifg=Grey93 guibg=black
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "sh":1,
			\ "python":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
nnoremap <Leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>


" Plug - markdown-preview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1 

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1 

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command ckkfan be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0 

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0 

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0


" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
function! g:EchoUrl(url)
	:echo a:url
endfunction
let g:mkdp_browserfunc = 'g:EchoUrl'

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1,
			\ 'sequence_diagrams': {},
			\ 'flowchart_diagrams': {}
			\ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
"let g:mkdp_markdown_css = '/Users/wallance/.vim/plugged/markdown-preview.nvim/css/Markdown.css'
let g:mkdp_markdown_css = ''

nnoremap M :MarkdownPreview<CR>
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = '8080'

" plug - markdown preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '${name}'


" plug - ultisnips
"设置tab键为触发键
let g:UltiSnipsExpandTrigger = '<c-j>'
"设置向后跳转键
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
"设置向前跳转键
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'
"设置打开配置文件时为垂直打开
let g:UltiSnipsEditSplit="vertical"

" setting - ranger

function! RangeChooser()
	let temp = tempname()
	if has("gui_running")
		exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
	else
		exec 'silent !ranger --choosefiles=' . shellescape(temp)
	endif
	if !filereadable(temp)
		redraw!
		return
	endif
	let names = readfile(temp)
	if empty(names)
		redraw!
		return
	endif
	exec 'edit ' . fnameescape(names[0])
	for name in names[1:]
		exec 'argadd ' . fnameescape(name)
	endfor
	redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<c-u>RangerChooser<CR>

" plug - syntastic

"noremap <Leader>q :lclose<CR>

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_signs = 1
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol='►'
"let g:syntastic_enable_highlighting=1
"let g:syntastic_python_checkers = ['pyflakes']

" plug - autoformat
noremap <F6> :Autoformat<CR>

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" plug - flake8
"noremap <LEADER>u :call flake8#Flake8UnplaceMarkers()


" plug - indent guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
":nmap <slient> <Leader>i <Plug>IndentGuidesToggle

" Plug - TagBar
nmap <S-Tab> :TagbarToggle<CR>
let g:tagbar_compact=1

" Plug - jupyter-vim
let g:jupyter_mapkeys = 0

" Run current file
nnoremap <buffer> <silent> <leader>R :JupyterRunFile<CR>
nnoremap <buffer> <silent> <leader>I :PythonImportThisFile<CR>

" Change to directory of current file
nnoremap <buffer> <silent> <leader>d :JupyterCd %:p:h<CR>

" Send a selection of lines
nnoremap <buffer> <silent> <leader>X :JupyterSendCell<CR>
nnoremap <buffer> <silent> <leader>E :JupyterSendRange<CR>
nmap     <buffer> <silent> <leader>e <Plug>JupyterRunTextObj
vmap     <buffer> <silent> <leader>e <Plug>JupyterRunVisual

nnoremap <buffer> <silent> <leader>U :JupyterUpdateShell<CR>

" Debugging maps
nnoremap <buffer> <silent> <leader>b :PythonSetBreak<CR>


" markdown snippets
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b ****** <++><Esc>F*hhi
autocmd Filetype markdown inoremap <buffer> ,t $$ <++><Esc>F$i
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ]
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>


autocmd Filetype python inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype python inoremap <buffer> ,# ##<Enter><++><Enter>##<Enter><Enter><++><Esc>4kA

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

let g:coc_global_extensions = ['coc-sql', 'coc-go', 'coc-tsserver', 'coc-json', 'coc-vimlsp', 'coc-python',  'coc-html', 'coc-marketplace', 'coc-snippets']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
set updatetime=100

set shortmess+=c
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>


inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use <LEADER>s to enable multi cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

" Use <C-l> for trigger snippet expand.
imap <C-j> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-k>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-h>'

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)
"
"Plug - vim-go
let g:go_def_mode = 'gopls'

" Fzf
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>



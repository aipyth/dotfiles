" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'		   " Show git status flags
Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
Plug 'PhilRunninger/nerdtree-buffer-ops'	   " highlight all visible nodes that are open  + close them

Plug 'itchyny/lightline.vim'                       " Lightline statusbar

" Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview

Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-commentary'			   " Enable commenting by keybindings
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-css-color'                            " Color previews for CSS
Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'                   " Git line changes preview
Plug 'elkowar/yuck.vim'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
:imap ii <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-t> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Normal           guifg=#dfdfdf ctermfg=15   guibg=#282c34 ctermbg=none  cterm=none
highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#282c34 ctermbg=none  cterm=none
highlight CursorLineNr     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none
highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none
highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight StatusLine       guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight StatusLineNC     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight NERDTreeClosable guifg=#98be65 ctermfg=2
highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8
highlight Comment          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=italic
highlight Constant         guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Special          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none
highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none
highlight String           guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Visual           guifg=#dfdfdf ctermfg=1    guibg=#1c1f24 ctermbg=none  cterm=none

highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
highlight Folded           ctermfg=103     ctermbg=234     cterm=none
highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <Leader>vv :Vifm<CR>
" map <Leader>vs :VsplitVifm<CR>
" map <Leader>sp :SplitVifm<CR>
" map <Leader>dv :DiffVifm<CR>
" map <Leader>tv :TabVifm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:instant_markdown_autostart = 0         " Turns off auto preview
" let g:instant_markdown_browser = "surf"      " Uses surf for preview
" map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
" map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <Leader>tt :vnew term://zsh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix Sizing Bug With Alacritty Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimTex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
" let maplocalleader = ","

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:python_highlight_all = 1
let g:auto_save = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
" set guifont=SauceCodePro\ Nerd\ Font:h15
"set guifont=Mononoki\ Nerd\ Font:h15
set guifont=JetBrains\ Mono:h15

let g:neovide_transparency=0.95

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal spell
set spelllang=nl,en_gb,uk
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inkscape figure bindings for LaTeX documents
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git-gutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
" highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg
" Update sign column every quarter second
set updatetime=250

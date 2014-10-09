execute pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256
set background=dark
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

map <C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <C-b> :CtrlPBuffer<CR>
map <C-g> :CtrlPLine<CR>
map <C-f> :CtrlPLine %<CR>

nmap <C-t> :TagbarToggle<CR>

let g:airline_theme='dark'
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1
let g:airline_enable_bufferline=1
set laststatus=2

highlight   clear
highlight   Pmenu         ctermfg=0 ctermbg=2
highlight   PmenuSel      ctermfg=0 ctermbg=7
highlight   PmenuSbar     ctermfg=7 ctermbg=0
highlight   PmenuThumb    ctermfg=0 ctermbg=7

function! Auto_complete_string()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
    end
endfunction

function! Auto_complete_opened()
    if pumvisible()
        return "\<Down>"
    end
        return ""
endfunction

inoremap <expr> <Nul> Auto_complete_string()
inoremap <expr> <C-Space> Auto_complete_string()

set completeopt-=preview


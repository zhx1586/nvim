"============================================================
"
" init-plugins.vim - 插件配置
"
"============================================================

let g:plug_list = ['airline']
let g:plug_list += ['coc-nvim', 'vim-go']

call plug#begin('$HOME/.config/nvim/plugged')


"------------------------------------------------------------
" airline
"------------------------------------------------------------
if index(g:plug_list, 'airline') >= 0
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_powerline_fonts = 0
    let g:airline_exclude_preview = 1
    let g:airline_section_b = '%n'
    let g:airline_theme = 'dark'
    let g:airline#extensions#branches#enable = 0
    let g:airline#extensions#syntastic#enable = 0
    let g:airline#extensions#fugitiveline#enable = 0
    let g:airline#extensions#csv#enable = 0
    let g:airline#extensions#vimagit#enable = 0
    let g:airline#extensions#tabline#enabled=1
endif


"------------------------------------------------------------
" vim-go
"------------------------------------------------------------
if index(g:plug_list, 'vim-go') >= 0
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
endif


"------------------------------------------------------------
" coc-nvim
"------------------------------------------------------------
if index(g:plug_list, 'coc-nvim') >= 0
    Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }

    " 关闭内置补全菜单信息
    set shortmess+=c

    " 使用 tab 触发补全
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " 使用 <cr> 确认补全
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

endif


call plug#end()

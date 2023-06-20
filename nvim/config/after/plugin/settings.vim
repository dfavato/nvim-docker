" Basics
set autoindent
set encoding=utf-8
set mouse=a
set nobackup
set noswapfile
set nowrap
set nowritebackup
set number
set relativenumber
set scrolloff=0 " Maintain cursor in the middle
set shiftwidth=0
set smarttab
set updatetime=300
set background=dark
set cursorline
" Transparent background
highlight Normal ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

filetype plugin indent on

set list
set shiftwidth=4 softtabstop=2 expandtab

autocmd VimLeave * mksession! .session.vim

lua << END
require('lualine').setup()
END

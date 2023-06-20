call plug#begin()
Plug 'almo7aya/openingh.nvim'  " Use OpenInGH command to open files in GitHub
Plug 'ap/vim-css-color'  " Highlight colors in css
Plug 'github/copilot.vim'
Plug 'kyazdani42/nvim-web-devicons'  " Icons
Plug 'lukas-reineke/indent-blankline.nvim'  " Indent guides
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lualine/lualine.nvim'  " Status line
Plug 'nvim-lua/plenary.nvim'  " Telescope dependency
Plug 'nvim-telescope/telescope.nvim', {'branch': '0.1.x'}  " Fuzzy search <c-p>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Improve highlights
Plug 'preservim/nerdtree'  " File explorer
Plug 'preservim/tagbar'  " <F3> to open the tagbar
Plug 'rafi/awesome-vim-colorschemes'  " Color schemes
Plug 'ryanoasis/vim-devicons'  " Icons
Plug 'tc50cal/vim-terminal'  " Terminal
Plug 'tpope/vim-commentary'    " gcc for commenting
Plug 'tpope/vim-fugitive'  " Git
Plug 'tpope/vim-surround'  " Change quotes and brackets
Plug 'weynhamz/vim-plugin-minibufexpl'  " Buffer explorer
call plug#end()


silent! colorscheme jellybeans

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-yaml',
  \ 'coc-xml',
  \ 'coc-git',
  \ 'coc-pyright',
  \ ]

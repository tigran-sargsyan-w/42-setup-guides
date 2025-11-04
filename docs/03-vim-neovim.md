# 03 — Vim/Neovim minimal config

Create `~/.vimrc` or `~/.config/nvim/init.vim`:
```vim
set nocompatible
set number
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set autoindent
set smartindent
set backspace=indent,eol,start
set colorcolumn=80
set termguicolors
syntax on
filetype plugin indent on
```

> Tip: For Neovim, prefer Lua configs later, but start simple.

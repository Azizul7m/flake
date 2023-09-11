{ pkgs, config, ... }: {

  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      extraConfig = ''
        syntax on
        set number
        set nobackup
        set noswapfile
        set smarttab
        set smartindent
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set expandtab

        let mapleader = " "
        inoremap jk <ESC>
        nmap <Leader>e :Lexplore<CR>

        "Navigate TAB
        nmap <Tab> :tabnext<CR>
        nmap <S-Tab> :tabprev<CR>
        nmap <leader>n :tabnew<CR>
        nmap <leader>wv :vsplit<cr>
        nmap <leader>wh :split<cr>
        nmap <leader>wq :wq<cr>
        nmap <leader>wx :q<cr>

        "resize buffer window with arrow
        nnoremap <silent> <C-Up> :resize +2<CR>
        nnoremap <silent> <C-down> :resize -2<CR>
        nnoremap <silent> <C-left> :vertical resize +2<CR>
        nnoremap <silent> <C-right> :vertical resize -2<CR>

        "Batter window Navigation
        nnoremap <C-h> <C-\><C-N><C-w>h
        nnoremap <C-j> <C-\><C-N><C-w>j
        nnoremap <C-k> <C-\><C-N><C-w>k
        nnoremap <C-l> <C-\><C-N><C-w>l
      '';
    };
  };
}

{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    sqlite
    scrot # screenshot
    editorconfig-core-c # Editor config
    wl-clipboard # for emacs org-mode
    emacsPackages.jsonrpc
    grip
    pandoc
    texliveTeTeX
    libvterm
    tree-sitter
    emacsPackages.vterm
    gnuplot 
    emacs-lsp-booster
  ];
  programs.emacs = {
    enable = true;
  };
  services.emacs = {
    package = pkgs.emacs-unstable;
    enable = true;
    defaultEditor = true;
    client.enable = true;
  };
}

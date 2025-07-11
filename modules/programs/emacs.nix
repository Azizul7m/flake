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
    wkhtmltopdf
    emacsPackages.vterm
    gnuplot
    emacs-lsp-booster
    emacs-gtk
  ];
  services.emacs = {
    package = pkgs.emacs;
    enable = true;
    defaultEditor = true;
    client.enable = true;
  };
}

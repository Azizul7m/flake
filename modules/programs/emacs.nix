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
    eask # Elisp package manager
    emacsPackages.epc
    python3Packages.epc 
    python3Packages.orjson 
    python3Packages.sexpdata 
    python3Packages.six
  ];
}

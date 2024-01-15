{ config, pkgs, ... }: {
  programs = { emacs = { enable = true; }; };
  home = {
    packages = with pkgs; [
      graphviz # org-mode visualization
      scrot # screenshot
      emacsPackages.sqlite3
      libvterm # Emacs Vterm
      editorconfig-core-c # Editor config
      wl-clipboard # for emacs org-mode
      emacsPackages.djvu
      emacsPackages.emacsql
      emacsPackages.telega
      emacsPackages.yasnippet-snippets
      emacsPackages.grip-mode
      texlive.combined.scheme-full # latex compailer
      pandoc
    ];
    file."config.doom" = {
      source = ../../src/doom;
      target = "${config.home.homeDirectory}/.config/doom";
    };
  };
}

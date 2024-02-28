{ config, pkgs, ... }: {
  home = {
    packages =( with pkgs; [
      emacs29
      sqlite
      graphviz # org-mode visualization
      scrot # screenshot
      editorconfig-core-c # Editor config
      wl-clipboard # for emacs org-mode
      emacsPackages.jsonrpc
      # emacsPackages.djvu
      # emacsPackages.emacsql
      grip
      tetex
      # wkhtmltopdf
      pandoc
      groff
      gnuplot # A portable command-line driven graphing utility for many platforms
    ]);
  };
  services.emacs.enable = true;
}

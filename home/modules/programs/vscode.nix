{ pkgs, ... }:

{
  programs = {
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
      ];
    };
  };
}

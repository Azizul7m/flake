{ pkgs, ... }:

{
  programs = {
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        yzhang.markdown-all-in-one
        mkhl.direnv
        ms-azuretools.vscode-docker
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
      ];
    };
  };
}

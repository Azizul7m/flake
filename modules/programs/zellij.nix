{ pkgs, ... }: {
  programs = {
    zellij = {
      enable = true;
      package = pkgs.zellij;
      settings = {
        theme= "gruvbox-dark";
        default_layout= "compact";
        simplified_ui = true;
      };
    };
  };
}

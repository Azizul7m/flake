{ pkgs, lib, config, ... }: {
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
  };
};
}

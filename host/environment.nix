{config, pkgs, ...}:
{
  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "emacs";
      BROWSER = "brave";
      NODE_PATH = "$HOME/.npm_global";
      PIP_PREFIX = "$HOME/.local/bin";
      NIXPKGS_ALLOW_UNFREE="1";
    };
  };
}

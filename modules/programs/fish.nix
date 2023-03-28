{pkgs, user, ...}:
{
  programs = {
    fish= {
      enable = true;
    plugins = [
        # Enable a plugin (here grc for colorized command output) from nixpkgs
        { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      ];
      interactiveShellInit = ''
      set fish_greeting # Disable greeting
      alias ls='exa --icons'
    '';
    # Add npm path to PATH
      shellInit = ''
        set -gx PATH /home/${user}/.npm-global/bin $PATH
      '';
      };
    };
}

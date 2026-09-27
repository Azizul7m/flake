{
  # Home Manager program modules. Add or remove a program here to change the
  # active desktop environment without editing home/home.nix.
  imports = [
    ./alacritty.nix
    ./emacs.nix
    ./fish.nix
    ./foot.nix
    ./hypr/hyprland.nix
    ./kitty.nix
    ./tmux.nix
    ./wofi.nix
    ./zoxide.nix
  ];
}

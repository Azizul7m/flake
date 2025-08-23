{pkgs, ...}: {
 catppuccin = {
  enable = true;
  flavor= "mocha";
  cache.enable = true;
  tty = {
    enable = true;
    flavor = "mocha";
  };
  grub = {
    enable = true;
    flavor = "mocha";
  };
  fcitx5 = {
    enable = true;
    flavor= "mocha";
    enableRounded = true;
 };
}

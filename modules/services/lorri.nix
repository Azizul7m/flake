{ pkgs, ... }:
with pkgs; {
  home = {
    services = {
      lorri = {
        enable = true;
        enableNotifications = true;
        package = lorri;
      };
    };
  };
}

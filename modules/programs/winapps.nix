{ config, pkgs, inputs, user, ... }: {
  home.packages = [
    inputs.winapps.packages.${pkgs.system}.winapps
    inputs.winapps.packages.${pkgs.system}.winapps-launcher
  ];

  xdg.configFile."winapps/winapps.conf".text = ''
    RDP_USER="anower"
    RDP_PASS="aa.."
    # RDP_IP="192.168.122.x"
    # RDP_DOMAIN="DOMAIN"
    # RDP_PORT=3389
    # RDP_FLAGS=""
    # WA_GROUP="WinApps"
  '';
}

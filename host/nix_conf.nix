{
  settings = {
    connect-timeout = 30; # Increase connection timeout to 30 seconds
    stalled-download-timeout =
      60; # Increase stalled download timeout to 60 seconds
    auto-optimise-store = true; # Optimise syslinks
    trusted-users = [ "root" "${user}" ];
    substituters = [ "https://cache.nixos.org/" ];
    extra-substituters = [ "https://anyrun.cachix.org" ];
    extra-trusted-public-keys =
      [ "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s=" ];
    experimental-features = [
      "flakes"
      "auto-allocate-uids"
      "nix-command"
      # "configurable-impure-env"
    ];
  };
  gc = {
    automatic = true; # Automatic garbage collection
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  package = pkgs.nixVersions.latest;
}

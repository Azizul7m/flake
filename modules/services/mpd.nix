{ pkgs, user, ... }:
{
  home.packages = with pkgs; [ mpd mpc-cli ncmpcpp ];
  services = {
    mpd = {
      enable = true;
      musicDirectory = "~/Music/";
      network = {
        startWhenNeeded = true;
        listenAddress = "any";
      };
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
  };
}

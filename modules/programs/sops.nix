{ config, pkgs, ... }:

{
  sops.gnupg.home = "~/.gnupg";

  sops.secrets.openai_api_key = {
    sopsFile = ./api.yaml;
    format = "yaml";
    key = "openai_api_key";
  };

  sops.secrets.gemini_api_key = {
    sopsFile = ./api.yaml;
    format = "yaml";
    key = "gemini_api_key";
  };

  sops.secrets.github_copilot_token = {
    sopsFile = ./api.yaml;
    format = "yaml";
    key = "github_copilot_token";
  };

  # Example user service using these secrets
  systemd.user.services.my-app = {
    Unit = {
      Description = "My app that needs API keys";
    };
    Service = {
      ExecStart = "${pkgs.curl}/bin/curl https://api.openai.com/v1/models";
      EnvironmentFile = [
        config.sops.secrets.openai_api_key.path
        config.sops.secrets.gemini_api_key.path
        config.sops.secrets.github_copilot_token.path
      ];
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}


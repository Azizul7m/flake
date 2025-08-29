{ config, ... }: {
  age = {
    identityPaths = [
      "/home/anower/.ssh/id_ed25519"
    ];
    secrets = {
      api = {
        file = ../secrets/gemini.age;
        owner = "anower";
      };
    };
  };
}


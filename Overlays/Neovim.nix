{self, pkgs}:
{
  overlay = final: prev: {
    neovim-unstable = prev.neovim.overrideAttrs (oldAttrs: rec {
      version = "0.9+";
      src = fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        rev = "master";
        sha256 = "0000000000000000000000000000000000000000000000000000";
      };
      doCheck = false;
    });
  };
}

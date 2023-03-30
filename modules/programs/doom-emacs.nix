{ pkgs, ... }: {

  programs = {
    doom-emacs = {
      enable = true;
      doomPrivateDir = ../../src/doom.d;
      emacsPackagesOverlay = final: prev: {
        company-org-roam = with final;
          (trivialBuild {
            src = pkgs.fetchFromGitHub {
              owner = "org-roam";
              repo = "company-org-roam";
              rev = "5d7ccd944519ae1d03f5e17ddfe33dcd8a0cc71e";
              sha256 = pkgs.lib.fakeSha256;
            };
            pname = "company-org-roam";
            packageRequires = [ s dash editorconfig ];
          });
      };
    };
  };
}

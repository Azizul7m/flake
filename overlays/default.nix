(self: super: {
  # Override libidn2 source
  libidn2 = super.libidn2.overrideAttrs (old: {
    src = super.fetchurl {
      url = "http://mirror.csclub.uwaterloo.ca/gnu/libidn/libidn2-2.3.8.tar.gz";
      sha256 = old.src.sha256; # Reuse the original hash
    };
  });

  # Override bash source and patches
  bash = super.bash.overrideAttrs (old: {
    src = super.fetchurl {
      url = "http://mirror.csclub.uwaterloo.ca/gnu/bash/bash-5.3.tar.gz";
      sha256 = old.src.sha256;
    };
    patches = super.lib.optionals (old.patches != null) (builtins.map (patch: super.fetchurl {
      url = "http://mirror.csclub.uwaterloo.ca/gnu/bash/bash-5.3-patches/${builtins.baseNameOf patch}";
      sha256 = patch.sha256;
    }) old.patches);
  });

  # Override binutils source
  binutils = super.binutils.overrideAttrs (old: {
    src = super.fetchurl {
      url = "http://mirror.csclub.uwaterloo.ca/gnu/binutils/binutils-2.44.tar.bz2";
      sha256 = old.src.sha256;
    };
  });

  # Override config.guess
  config = super.config.overrideAttrs (old: {
    src = super.fetchurl {
      url = "http://git.savannah.gnu.org/cgit/config.git/plain/config.guess?id=948ae97ca5703224bd3eada06b7a69f40dd15a02";
      sha256 = old.src.sha256;
    };
  });
})

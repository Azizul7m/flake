{ pkgs, config,  ... }: {
  programs = { fish.enable = true;};
  home = with pkgs; {
    packages = ([
      # gdbgui

      ### SYSTEM LIBRARIES ###
      libepoxy # OpenGL function manager
      libxkbcommon # Keyboard handling
      libdecor # Wayland client decorations

      ### PROGRAMMING LANGUAGES ###
      # JavaScript/TypeScript
      nodejs
      nodePackages_latest.typescript-language-server

      # Python
      python3Full
      python3Packages.pip
      poetry # Package management
      pyright # Static type checker
      jython # Python for JVM

      # Rust
      rustup
      trunk # WASM bundler

      # (Web3)
      solc # Solidity compiler
      solana-cli # Solana CLI

      ### NIX ECOSYSTEM ###
      devbox # Dev environments
      direnv # Environment switcher
      nix-direnv # Nix integration
      nixfmt-classic # Formatter
      nixd # Language server
      nixdoc # Documentation

      ### MOBILE DEVELOPMENT ###
      android-tools # ADB/fastboot
      adb-sync # File sync
      adbfs-rootless # FUSE filesystem

      ### DEVOPS & CONTAINERS ###
      docker-compose
      dockfmt # Dockerfile formatter
      docker-ls # Language server
      docker-compose-language-service

      ### SECURITY TOOLS ###
      #burpsuite # Web security testing
      # metasploit # Penetration framework
      # nikto # Web scanner
      # ghostscript # PDF processor (security research)
      # hey # test webserver

      ### PRODUCTIVITY TOOLS ###
      # Shell Enhancements

      # CLI Utilities
      yt-dlp # Media downloader
      asciinema # Terminal recorder
      imgurbash2 # Image uploader
      ragenix

      # Text Processing
      hunspell # Spell checker
      hunspellDicts.en_US
      shfmt # Shell formatter
      typioca # Typing test

      ### LANGUAGE SERVERS (LSPs) ###
      nil # nix
      copilot-language-server
      bash-language-server
      yaml-language-server
      nginx-language-server
      prettier
      sqls # SQL
      #texlab # LaTeX
      tailwindcss-language-server
      vscode-langservers-extracted
      superhtml
      jellyfin-ffmpeg # Media support

      ### AI/ML TOOLS ###
      gemini-cli
      n8n # Workflow automation
    ]);

  };
}

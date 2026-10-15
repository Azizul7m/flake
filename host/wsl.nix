{
  config,
  lib,
  pkgs,
  user,
  fullName,
  ...
}:

let
  # These packages are optional in nixpkgs and can disappear or be renamed
  # between channels. Keep the WSL profile evaluable while using them when
  # the selected nixpkgs revision provides them.
  optionalPackages = lib.flatten [
    (lib.optionals (pkgs ? cargo-audit) [ pkgs.cargo-audit ])
    (lib.optionals (pkgs ? cargo-deny) [ pkgs.cargo-deny ])
    (lib.optionals (pkgs ? cargo-edit) [ pkgs.cargo-edit ])
    (lib.optionals (pkgs ? cargo-expand) [ pkgs.cargo-expand ])
    (lib.optionals (pkgs ? cargo-nextest) [ pkgs.cargo-nextest ])
    (lib.optionals (pkgs ? cargo-watch) [ pkgs.cargo-watch ])
    (lib.optionals (pkgs ? sqlx-cli) [ pkgs.sqlx-cli ])
    (lib.optionals (pkgs ? solana-cli) [ pkgs.solana-cli ])
    (lib.optionals (pkgs ? anchor-cli) [ pkgs.anchor-cli ])
    (lib.optionals (pkgs ? wasm-pack) [ pkgs.wasm-pack ])
    (lib.optionals (pkgs ? wasm-bindgen-cli) [ pkgs.wasm-bindgen-cli ])
    (lib.optionals (pkgs ? pnpm) [ pkgs.pnpm ])
    (lib.optionals (pkgs ? yarn) [ pkgs.yarn ])
  ];
in
{
  # NixOS-WSL supplies the WSL init, interop, and filesystem integration.
  wsl = {
    enable = true;
    defaultUser = user;
    interop.register = true;
  };

  networking.hostName = "wsl";
  time.timeZone = "Asia/Dhaka";

  users.users.${user} = {
    isNormalUser = true;
    description = fullName;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    # Rust toolchain and language-server support.
    rustup
    rust-analyzer
    clippy
    rustfmt

    # Rust project quality, test, database, and WebAssembly tooling.

    # Solana clients and Anchor projects commonly use this JS toolchain too.
    nodejs

    # Native dependencies used by Rust crates and Solana/Web3 builds.
    clang
    lld
    pkg-config
    protobuf
    openssl
    openssl.dev

    # Daily development utilities.
    git
    gh
    neovim
    jq
    ripgrep
    fd
    fzf
    curl
    wget
  ] ++ optionalPackages;

  environment.variables = {
    # Lets bindgen and OpenSSL-based crates discover their native dependencies.
    PKG_CONFIG_PATH = lib.makeSearchPath "lib/pkgconfig" [ pkgs.openssl.dev ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # WSL does not use a traditional bootloader. Keep this profile independent
  # from the desktop machine's hardware, display server, and network modules.
  boot.isContainer = true;
  system.stateVersion = "24.05";
}

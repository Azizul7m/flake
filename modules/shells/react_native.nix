{ config, pkgs, ... }:
let
  android-sdk = pkgs.androidsdk.override {
    enableSdk = true;
    platformVersions = [ "33" ];
    buildToolsVersions = [ "33.0.0" ];
    includeEmulator = true;
    includeNDK = true;
  };
in {
  home.packages = with pkgs;
    [
      android-tools # adb, fastboot
      yarn
      watchman
      react-native-debugger
    ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ android-sdk ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      cocoapods # iOS dependencies
    ];
  home.sessionVariables = {
    ANDROID_HOME = "${android-sdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = "${android-sdk}/libexec/android-sdk";
    PATH =
      "$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH";
  };
  programs.fish.interactiveShellInit = ''
    set -x PATH $HOME/.config/yarn/global/node_modules/.bin $PATH
  '';
  programs.zsh.initExtra = ''
    export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  '';
}

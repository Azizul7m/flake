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
  };
  home.sessionPath = [
    "$HOME/.config/yarn/global/node_modules/.bin"
    "${android-sdk}/libexec/android-sdk/emulator"
    "${android-sdk}/libexec/android-sdk/tools"
    "${android-sdk}/libexec/android-sdk/tools/bin"
    "${android-sdk}/libexec/android-sdk/platform-tools"
  ];
}

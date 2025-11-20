final: prev: {
  # Patch the base openbangla-keyboard package
  openbangla-keyboard = prev.openbangla-keyboard.overrideAttrs (old: {
    cmakeFlags = (old.cmakeFlags or []) ++ [
      "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    ];
  });

  # Also patch the fcitx5 variant (it depends on the same CMake setup)
  fcitx5-openbangla-keyboard = prev.fcitx5-openbangla-keyboard.overrideAttrs (old: {
    cmakeFlags = (old.cmakeFlags or []) ++ [
      "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    ];
  });
}

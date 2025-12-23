{ pkgs, ... }: {
  # ... অন্যান্য কনফিগারেশন ...
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true; # Hyprland এর জন্য এটি জরুরি
      addons = with pkgs; [
        fcitx5-openbangla-keyboard
        fcitx5-gtk # GTK অ্যাপের সাপোর্টের জন্য
        #  fcitx5-configtool # এটি অটোমেটিক ইনক্লুড হতে পারে, তবে রাখা ভালো
      ];
    };
  };

  # এনভায়রনমেন্ট ভেরিয়েবল সেট করা (এটি অ্যাপগুলোতে ইনপুট পেতে সাহায্য করবে)
  environment.sessionVariables = {
    #    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
}

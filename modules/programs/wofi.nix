{config, pkgs, ...}: {
  programs = {
    wofi = {
      enable = true;
      settings = {
        location = "center";
        height = 400;
        width= 650;
        show_all= false;
        print_command= true;
        insensitive= true;
        prompt= "Hmm, what do you want to run?";
      };
    };
  };

}

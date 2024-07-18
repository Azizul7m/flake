{pkgs, ...} : {
  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    # options = ["--cmd cd"];     # 
  };
}

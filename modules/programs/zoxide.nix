{pkgs, ...} : {
  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # options = ["--cmd cd"];     # 
  };
}

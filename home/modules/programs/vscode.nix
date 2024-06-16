{config, pkgs , ...}: {
  programs.vscode = {
    enable = true;
    package= pkgs.vscodium;
    enableUpdateCheck = true;
    extensions= with pkgs.vscode-extensions; [
      vscodevim.vim     
      bbenoist.nix
      rust-lang.rust-analyzer
    ];
    userSettings = {
        "editor.tabSize"= 2;
        "editor.fontSize"= 14;
        "editor.minimap.enabled"= false;
        "files.autoSave"= "afterDelay";
        "editor.fontFamily"= "'Iosevka', 'monospace', monospace";
        "window.customTitleBarVisibility"= "auto";
        "window.menuBarVisibility"= "toggle";
        "workbench.sideBar.location"= "right";
        "workbench.colorTheme"= "One Dark Pro Mix";

        "vim.leader"= "<space>";
        "vim.easymotion" = true;
        "vim.incsearch"= true;
        "vim.useSystemClipboard"= true;
        "vim.useCtrlKeys"= true;
        "vim.hlsearch"= true;
        "vim.handleKeys"= {
            "<C-p>"= false;
        };
        "vim.insertModeKeyBindings"= [
            {
                "before"= ["j" "k"];
                "after"= ["<Esc>"];
            }
        ];
    };
  };
}

{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    # userSettings = {
    #     "editor.tabSize"= 2;
    #     "editor.fontSize"= 15;
    #     "editor.minimap.enabled"= false;
    #     "editor.fontLigatures"= true;
    #     "editor.fontFamily"= "'Iosevka', 'monospace', monospace";

    #     "files.autoSave"= "afterDelay";
    #     "window.customTitleBarVisibility"= "auto";
    #     "window.menuBarVisibility"= "toggle";
    #     "workbench.sideBar.location"= "right";
    #     "workbench.colorTheme"= "One Dark Pro Mix";

    #     "vim.leader"= "<space>";
    #     "vim.easymotion" = true;
    #     "vim.incsearch"= true;
    #     "vim.useSystemClipboard"= true;
    #     "vim.useCtrlKeys"= true;
    #     "vim.hlsearch"= true;
    #     "vim.handleKeys"= {
    #         "<C-p>"= false;
    #     };
    #     "vim.insertModeKeyBindings"= [
    #         {
    #             "before"= ["j" "k"];
    #             "after"= ["<Esc>"];
    #         }
    #     ];
    # };
  };
}

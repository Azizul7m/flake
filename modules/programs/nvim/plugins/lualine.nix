{
  enable = true;
  settings = {
    theme = "auto";
    icons_enabled = true;
    globalstatus = true;
    extensions = [ "quickfix" "nvim-tree" "toggleterm" ];
    sections = {
      lualine_x = [ "diagnostics" "encoding" "fileformat" "filetype" ];
      lualine_y = [ "progress" ];
      lualine_z = [ "location" ];
    };
  };
}

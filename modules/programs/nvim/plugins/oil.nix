{
  enable = true; # File explorer
  settings = {
    default_file_explorer = true;
    delete_to_trash = true;
    lsp_file_methods = { enabled = true; };
    columns = [ "icon" "size" ];
    buf_options = {
      buflisted = false;
      bufhidden = "hide";
    };
    float = {
      padding = 2;
      max_width = { __raw = "0.7"; };
      max_height = { __raw = "0.7"; };
      border = "rounded";
      win_options = { winblend = 0; };
    };
    preview_win = {
      update_on_cursor_moved = true;
      preview_method = "fast_scratch";
    };
    keymaps = {
      "-" = "actions.parent";
      "q" = "actions.close";
      "h" = "actions.parent";
      "l" = "actions.select";
      "<CR>" = "actions.select";
      "<Tab>" = "actions.select";
      "r" = "actions.refresh";
      "p" = "actions.preview";
      "<M-h>" = "actions.select_split";
      "<M-s>" = "actions.select_vsplit";
      "<M-t>" = "actions.select_tab";
      _ = "actions.open_cwd";
      "`" = "actions.cd";
      "g." = "actions.toggle_hidden";
      "g?" = "actions.show_help";
      "g\\" = "actions.toggle_trash";
      gs = "actions.change_sort";
      gx = "actions.open_external";
      "~" = "actions.tcd";
    };
  };
}

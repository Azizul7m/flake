{
  enable = true;
  settings = {
    legacy_commands = false; # remove deprecation warning ✅
    workspaces = [{
      name = "personal";
      path = "~/.notes/md/workspaces";
    }];
    notes_subdir = "notes"; # relative to workspace path
    daily_notes = {
      folder = "daily";
      date_format = "%Y-%m-%d";
      alias_format = "%B %-d, %Y";
      template = "daily.md";
    };
    sort_by = "modified";
    sort_reversed = true;
    open_notes_in = "vsplit";
    ui = {
      enable = true;
      update_debounce = 200;
    };

    attachments = {
      img_folder = "assets/imgs";
      confirm_img_paste = true;
    };
  };
}

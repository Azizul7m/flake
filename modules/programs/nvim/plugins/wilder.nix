{
  enable = true;
  modes = [ ":" "/" "?" ];
  enableCmdlineEnter = true;
  nextKey = "<Tab>";
  prevKey = "<S-Tab>";

  extraOptions = {
    renderer = ''
      require("wilder").set_option('renderer', require("wilder").popupmenu_renderer({
        highlighter = require("wilder").basic_highlighter(),
        left = {' ', require("wilder").popupmenu_devicons()},
        right = {' ', require("wilder").popupmenu_scrollbar()},
      }))
    '';
  };
}


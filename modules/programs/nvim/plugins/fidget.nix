{
  enable = true; # LSP progress
  settings = {
    progress = {
      poll_rate = 100; # Poll for progress notifications every 100ms
      suppress_on_insert =
        true; # Hide progress notifications while in insert mode
      ignore_done_already = false; # Show progress messages even if already done
      ignore_empty_message = true; # Ignore tasks with empty messages
      display = {
        render_limit = 10; # Show up to 10 messages at once
        done_icon = "✔"; # Icon for completed tasks
        done_style = "Constant"; # Highlight group for completed tasks
        progress_icon = [ "dots" ]; # Animated dots for progress
        progress_style = "WarningMsg"; # Highlight group for in-progress tasks
        group_style = "Title"; # Highlight for group/server name
        icon_style = "Question"; # Highlight for icon
        skip_history = true;
      };
      lsp = {
        progress_ringbuf_size =
          128; # Keep up to 128 progress events in the buffer
        log_handler = false; # Don't log progress handler calls
      };
    };
    # General notification settings
    notification = {
      poll_rate = 30; # Update notifications at 30 FPS
      filter = "info"; # Minimum log level to display
      history_size = 128; # Store up to 128 items in history
      override_vim_notify = true; # Use Fidget for vim.notify()
      view = {
        stack_upwards = true; # Show notifications bottom-to-top
        icon_separator = " "; # Space between icon and group name
        group_separator = "--"; # Separator between groups
        group_separator_hl = "Comment"; # Highlight group for separator
      };
      /* window = {
           normal_hl = "Comment"; # Basic highlight group
           winblend = 20; # Slightly transparent notification window
           border = "rounded"; # Rounded window border
           zindex = 45; # Window stacking priority
           max_width = 60; # Max width of window
           max_height = 20; # Max height of window
           x_padding = 2; # Horizontal padding
           y_padding = 2; # Vertical padding
           align = "bottom"; # Align window at the bottom
           relative = "editor"; # Position relative to the editor
         };
      */
    };
    # Integrations
    integration = {
      nvim-tree.enable = true; # Enable nvim-tree integration
      xcodebuild-nvim.enable = false; # Disable xcodebuild-nvim integration
    };

    # Logger settings
    logger = {
      level = "warn"; # Only warn and error logs
      max_size = 10000; # Max size of log file (KB)
      float_precision = 1.0e-2; # 2 decimal places for floats
      # path left as default
    };
  };
}

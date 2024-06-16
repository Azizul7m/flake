{config, lib, pkgs, ...}: {
  services= {
    swaync = {
      enable = true;
      settings = {
        positionX= "right";
        positionY= "bottom";
        timeout= 15;
        timeout-low= 5;
        timeout-critical= 0;
        fit-to-screen= true;
        keyboard-shortcuts= true;
        image-visibility= "when-available";
        transition-time= 100;
        hide-on-clear= true;
        hide-on-action= true;
        script-fail-notify= true;
        control-center-margin-top= 2;
        control-center-margin-bottom= 2;
        control-center-margin-right= 2;
        control-center-margin-left= 2;
        notification-icon-size= 45;
        notification-body-image-height= 60;
        notification-body-image-width= 120;
        control-center-width= 360;
        control-center-height= 600;
        notification-window-width= 360;
        widgets= [
            "volume"
            "title"
            "mpris"
            "dnd"
            "notifications"
        ];
        widget-config= {
            volume= {
                label= "󰕾 ";
            };
            title= {
                text= "Notifications";
                clear-all-button= true;
                button-text= "Clear All";
            };
            dnd= {
                text= "Do Not Disturb";
            };
            label= {
                max-lines= 1;
                text= "Notification Center";
            };
            mpris= {
                image-size= 45;
                image-radius= 8;
            };
        };
      };
      style = ''
              *{
                font-size: 10px;
              }
               .notification-row {
                   outline: none;
                }
                .notification-row:focus,
                .notification-row:hover {
                    background: @noti-bg-focus;
                }
                .notification {
                    border-radius: 5px;
                    margin: 6px 12px;
                    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7),
                        0 2px 6px 2px rgba(0, 0, 0, 0.3);
                    padding: 0;
                }
       '';
    };
  };
}

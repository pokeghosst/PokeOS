{ pkgs
, ...
}:

let
  icons = { };
in
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
    };

    script = "polybar bar &";
    config =
      let
        background = "#99000000";
        background-alt = "#99000000";

        foreground = "#ffdddddd";
        foreground-alt = "#ffdddddd";

        primary = "#ff006633";
        secondary = "#ff003333";
        alert = "#ff330000";

        fonts = {
          font-0 = "Cascadia Code:pixelsize=10;2";
        };
      in
      {
        "bar/main" = fonts // {
          bottom = true;
          monitor = "\${env:MONITOR:eDP-1}";
          width = "100%";
          height = "26px";
          radius = 0;
          modules-left = "i3 tray";
          modules-right = "date volume backlight eth wlan battery";
          background = "#00000000";
        };

        "settings" = {
          screenchange-reload = "true";
          pseudo-transparency = true;
        };

        "module/date" = {
          type = "internal/date";
          internal = 5;
          date = "%m/%d/%y";
          time = "%I:%M %p";
          label = "%time% %date%";
          format-padding = 1;
          format-background = "#697660";
          format-foreground = "#2e2e2e";
        };

        "module/i3" = {
          type = "internal/i3";
          format = " <label-state> <label-mode>";
          index-sort = true;
          wrapping-scroll = false;

          # Only show workspaces on the same output as the bar
          pin-workspaces = true;

          label-mode-padding = 1;
          label-mode-foreground = "#000";
          label-mode-background = primary;

          # focused = "Active workspace on focused monitor";
          label-focused = "%index%";
          label-focused-background = "#697660";
          label-focused-padding = 1;

          # unfocused = "Inactive workspace on any monitor";
          label-unfocused = "%index%";
          label-unfocused-background = background;
          label-unfocused-padding = 1;

          # visible = "Active workspace on unfocused monitor";
          label-visible = "%index%";
          label-visible-background = secondary;
          label-visible-padding = 1;

          # urgent = "Workspace with urgency hint set";
          label-urgent = "%index%";
          label-urgent-background = alert;
          label-urgent-padding = 1;

          label-separator = "|";
          label-separator-padding = 0;
        };

        "module/battery" = {
          type = "internal/battery";
          battery = "BAT0";
          adapter = "AC";
          full-at = "90";

          format-charging = "<animation-charging><label-charging>";
          format-discharging = " <label-discharging>";

          format-full-prefix = " ";

          animation-charging-0 = "  ";
          animation-charging-1 = " +";
          animation-charging-framerate = 750;

          format-discharging-background = "#697660";
          format-discharging-foreground = "#2e2e2e";

          format-charging-background = "#697660";
          format-charging-foreground = "#2e2e2e";

          format-full-background = "#697660";
          format-full-foreground = "#2e2e2e";

          # poll-interval = 5;

        };

        "module/volume" = {
          type = "internal/alsa";
          format-volume = "<label-volume> <bar-volume>";
          label-volume = "VOL";

          format-volume-background = "#697660";
          format-volume-foreground = "#2e2e2e";
          format-volume-padding = 1;

          label-muted = "muted";
          format-muted-background = "#697660";
          format-muted-foreground = "#2e2e2e";
          format-muted-padding = 1;

          bar-volume-width = "10";
          bar-volume-gradient = true;
          bar-volume-indicator = "|";
          bar-volume-indicator-font = "2";
          bar-volume-fill = "─";
          bar-volume-fill-font = "2";
          bar-volume-empty = "─";
          bar-volume-empty-font = "2";
        };

        "module/backlight" = {
          type = "internal/backlight";

          card = "intel_backlight";

          format = "<label> <bar>";
          label = "BL";

          format-background = "#697660";
          format-foreground = "#2e2e2e";

          format-padding = 1;

          bar-width = "10";
          bar-indicator = "|";
          bar-indicator-foreground = "#2e2e2e";
          bar-indicator-font = "2";
          bar-fill = "─";
          bar-fill-font = "2";
          bar-fill-foreground = "#2e2e2e";
          bar-empty = "─";
          bar-empty-font = "2";
          bar-empty-foreground = "#2e2e2e";
        };

        "module/eth" = {
          type = "internal/network";
          interval = "3.0";
          interface-type = "wired";

          format-connected-underline = "#06FFCC";
          format-disconnected-underline = "#06FFCC";
          format-connected-prefix-foreground = foreground-alt;
          label-connected =
            "eth %ifname% u%upspeed:9% d%downspeed:9%)";
        };

        "module/wlan" = {
          type = "internal/network";
          interval = "3.0";
          interface-type = "wireless";

          format-connected-background = "#697660";
          format-connected-foreground = "#2e2e2e";
          format-disconnected-background = "#697660";
          format-disconnected-foreground = "#2e2e2e";

          format-connected = "wlan <ramp-signal>";

          ramp-signal-0 = "▁";
          ramp-signal-1 = "▂";
          ramp-signal-2 = "▃";
          ramp-signal-3 = "▄";
          ramp-signal-4 = "▅";
          ramp-signal-5 = "▆";
          ramp-signal-6 = "▇";
          ramp-signal-7 = "█";
          ramp-signal-background = "#697660";
          ramp-signal-foreground = "#2e2e2e";
        };

        "module/xkeyboard" = {
          type = "internal/xkeyboard";
          blacklist-0 = "num lock";

          format-prefix = " ";
          format-prefix-foreground = foreground-alt;

          label-layout = "%layout%";

          label-indicator-padding = "2";
          label-indicator-margin = "1";
          label-indicator-background = secondary;
        };

        "module/tray" = {
          type = "internal/tray";
        };
      };
  };
}

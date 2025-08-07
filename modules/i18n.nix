{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      anthy
    ];
  };
}

# {
#   i18n.inputMethod = {
#     enable = true;
#     type = "fcitx5";
#     fcitx5 = {
#       addons = with pkgs; [
#         fcitx5-anthy
#         fcitx5-gtk
#       ];
      
#       waylandFrontend = true;
#       ignoreUserConfig = true;

#       settings = {
#         inputMethod = {
#           GroupOrder."0" = "Default";
#           "Groups/0" = {
#             Name = "Default";
#             "Default Layout" = "us";
#             DefaultIM = "keyboard-ru";
#           };
#           "Groups/0/Items/0".Name = "keyboard-us";
#           "Groups/0/Items/1".Name = "keyboard-ru";
#           "Groups/0/Items/2".Name = "keyboard-ua";
#           "Groups/0/Items/3".Name = "anthy";
#         };
#         # globalOptions = { };
#       };
#     };
#   };
# }

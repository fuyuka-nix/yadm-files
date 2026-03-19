{
    palette
}:
builtins.concatStringsSep "\n" [
    "foreground #${palette.base05}"
    "background #${palette.base00}"
    "selection_foreground #${palette.base01}"
    "selection_background #${palette.base06}"

    "color0 #${palette.base00}"
    "color1 #${palette.base08}"
    "color2 #${palette.base0B}"
    "color3 #${palette.base0A}"
    "color4 #${palette.base0D}"
    "color5 #${palette.base0E}"
    "color6 #${palette.base0C}"
    "color7 #${palette.base05}"

    "color8 #${palette.base02}"
    "color9 #${palette.base0F}"
    "color10 #${palette.base04}"
    "color11 #${palette.base0A}"
    "color12 #${palette.base03}"
    "color13 #${palette.base07}"
    "color14 #${palette.base0C}"
    "color15 #${palette.base05}"

    "active_tab_foreground #${palette.base02}"
    "active_tab_background #${palette.base04}"
    "inactive_tab_foreground #${palette.base01}"
    "inactive_tab_background #${palette.base03}"
]

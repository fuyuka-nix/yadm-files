let
    palette = builtins.fromJSON (builtins.readFile ../stylix/palette.json);
    paletize = x: import x { inherit palette; };
in
{
    ".config" = {
        kitty."palette.conf" = paletize ./kitty.nix;
        quickshell.config."Styles.qml" = paletize ./quickshell.nix;
    };
}

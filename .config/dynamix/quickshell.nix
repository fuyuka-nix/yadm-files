{
    palette,
}:
let
    colors = map (x: {name = "b0${x}"; value = palette."base0${x}";}) [
        "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "A" "B" "C" "D" "E" "F"
    ];
in
builtins.concatStringsSep "\n" (builtins.concatLists [[
    "pragma Singleton" ""
    "import Quickshell"
    "import Quickshell.Io"
    "import QtQuick" ""
    "Singleton {"
    "\tproperty QtObject colors: colors"
    "\tQtObject {"
    "\tid: colors"
] (map (x: "\t\tproperty color ${x.name}: \"#${x.value}\"") colors) [
    "\t}"
    "}"
]])

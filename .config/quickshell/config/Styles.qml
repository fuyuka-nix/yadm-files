pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
	property QtObject colors: colors
	QtObject {
	id: colors
		property color b00: "#24273a"
		property color b01: "#1e2030"
		property color b02: "#363a4f"
		property color b03: "#494d64"
		property color b04: "#5b6078"
		property color b05: "#cad3f5"
		property color b06: "#f4dbd6"
		property color b07: "#b7bdf8"
		property color b08: "#ed8796"
		property color b09: "#f5a97f"
		property color b0A: "#eed49f"
		property color b0B: "#a6da95"
		property color b0C: "#8bd5ca"
		property color b0D: "#8aadf4"
		property color b0E: "#c6a0f6"
		property color b0F: "#f0c6c6"
	}
}
import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    PanelWindow {
      anchors {
        left: true
        right: true
        bottom: true
      }
      implicitHeight: 40
      visible: false

      Process {
        id: hyprNotifProc
        property string testText: "test"

        command: ["hyprctl", "notify", "2", "3300", "0", this.testText]
      }

      Column {
        anchors.fill: parent

        Button {
          text: "testExit"

          onClicked: {
            hyprNotifProc.testText = "exit"
            hyprNotifProc.running = true
          }
        }
        Button {
          text: "testRetry"

          onClicked: {
            hyprNotifProc.testText = "retry"
            hyprNotifProc.running = true
          }
        }
      }
    }
  }
}

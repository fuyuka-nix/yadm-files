import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import QtQuick
import qs.config


Scope {
  id: root

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      implicitHeight: 40

      anchors {
        top: true
        left: true
        right: true
      }

      Rectangle {
        anchors {
          fill: parent
          verticalCenter: parent.verticalCenter
        }
        color: Styles.colours.b00

        Row {
          anchors {
            verticalCenter: parent.verticalCenter
            fill: parent
            margins: 5
          }
          spacing: 5

          Rectangle {
            height: parent.height
            width: height * 1.4
            radius: 3
          }
          Rectangle {
            height: parent.height
            width: height * 1.4
            radius: 3
          }
        }
        Row {
          anchors {
            verticalCenter: parent.verticalCenter
            fill: parent
            margins: 5
          }
          spacing: 5
          layoutDirection: Qt.rightToLeft
          LayoutMirroring.enabled: true

          Rectangle {
            height: parent.height
            width: 300
            radius: 3

            Text {
              anchors.centerIn: parent

              text: Qt.formatDateTime(clock.date, "yyyy年M月d日 H時m分s秒")
            }
          }
          Rectangle {
            height: parent.height
            width: 110
            radius: 3

            Text {
              anchors.centerIn: parent

              text: "Fuyuka.nix"
            }
          }
          Rectangle {
            height: parent.height
            width: 60
            radius: 3

            Text {
              anchors.centerIn: parent
              text: { return Math.round(UPower.displayDevice.percentage * 100) + "%"; }
            }
          }
        }
      }
    }
  }

  SystemClock {
    id: clock
  }
}


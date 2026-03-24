import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire
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
        color: Styles.colors.b00

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
            color: Styles.colors.b05
          }
          Rectangle {
            height: parent.height
            width: height * 1.4
            radius: 3
            color: Styles.colors.b05
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
            color: Styles.colors.b05

            Text {
              anchors.centerIn: parent
              color: Styles.colors.b00

              text: Qt.formatDateTime(clock.date, "yyyy年M月d日 H時m分s秒")
            }
          }
          Rectangle {
            height: parent.height
            width: 110
            radius: 3
            color: Styles.colors.b05

            Text {
              anchors.centerIn: parent
              color: Styles.colors.b00

              text: "Fuyuka.nix"
            }
          }
          Rectangle {
            height: parent.height
            width: 60
            radius: 3
            color: Styles.colors.b05

            Text {
              anchors.centerIn: parent
              color: Styles.colors.b00
              text: { return Math.round(UPower.displayDevice.percentage * 100) + "󰄌"; }
            }
          }
          Rectangle {
            height: parent.height
            width: 60
            radius: 3
            color: Styles.colors.b05

            Text {
              readonly property var nodes: Pipewire.nodes.values.reduce((acc, node) => {
                if (!node.isStream) {
                    if (node.isSink)
                        acc.sinks.push(node);
                    else if (node.audio)
                        acc.sources.push(node);
                } else if (node.isStream && node.audio) {
                    // Application streams (output streams)
                    acc.streams.push(node);
                }
                return acc;
              }, {
                  sources: [],
                  sinks: [],
                  streams: []
              })

              readonly property list<PwNode> sinks: nodes.sinks
              readonly property PwNode sink: Pipewire.defaultAudioSink
              readonly property real volume: sink?.audio?.volume ?? 0
              anchors.centerIn: parent
              color: Styles.colors.b00

              id: audioLabel
              text: { return Math.round(volume * 100) + "󰖀"; }

              PwObjectTracker {
                objects: audioLabel.sinks
              }
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


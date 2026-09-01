import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.Commons
import qs.Ui

Item {
  id: root

  property var shell: null
  property var manifest: null
  property bool opened: false

  readonly property string homeRed: "#dc1f26"
  readonly property string awayBlue: "#0845ba"
  readonly property string pluginId: (manifest && manifest.id) ? String(manifest.id) : "io.github.anujraja.manchester-united"

  function open(payloadJson) {
    root.opened = true
    Qt.callLater(function() { keyCatcher.forceActiveFocus() })
  }

  function close() {
    root.opened = false
  }

  function dismiss() {
    root.opened = false
    if (root.shell && typeof root.shell.hide === "function")
      root.shell.hide(root.pluginId)
  }

  function toggle() {
    if (root.opened) root.dismiss()
    else root.open("{}")
  }

  PanelWindow {
    id: panel
    visible: root.opened
    anchors { top: true; bottom: true; left: true; right: true }
    color: "transparent"
    WlrLayershell.namespace: "manchester-united"
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
    exclusionMode: ExclusionMode.Ignore

    Rectangle {
      anchors.fill: parent
      color: Qt.rgba(0.043, 0.071, 0.125, 0.88)
    }

    MouseArea {
      anchors.fill: parent
      onClicked: root.dismiss()
    }

    Item {
      id: keyCatcher
      anchors.fill: parent
      focus: true

      Keys.onPressed: function(event) {
        if (event.key === Qt.Key_Escape || event.key === Qt.Key_Return || event.key === Qt.Key_Space) {
          root.dismiss()
          event.accepted = true
        }
      }

      Column {
        anchors.centerIn: parent
        spacing: Style.space(18)

        Row {
          anchors.horizontalCenter: parent.horizontalCenter
          spacing: 0
          height: Style.space(8)

          Rectangle { width: Style.space(72); height: parent.height; color: root.homeRed }
          Rectangle { width: Style.space(72); height: parent.height; color: root.awayBlue }
        }

        Text {
          anchors.horizontalCenter: parent.horizontalCenter
          text: "UNITED"
          color: "#f7f9fc"
          font.family: Style.font.family
          font.pixelSize: Style.font.display
          font.bold: true
          font.letterSpacing: 18
        }

        Text {
          anchors.horizontalCenter: parent.horizontalCenter
          text: "THEATRE OF DREAMS"
          color: "#c7d2e3"
          font.family: Style.font.family
          font.pixelSize: Style.font.body
          font.letterSpacing: 8
        }

        Row {
          anchors.horizontalCenter: parent.horizontalCenter
          spacing: 0
          height: Style.space(8)

          Rectangle { width: Style.space(72); height: parent.height; color: root.awayBlue }
          Rectangle { width: Style.space(72); height: parent.height; color: root.homeRed }
        }
      }
    }
  }
}

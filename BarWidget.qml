import QtQuick
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "io.github.anujraja.manchester-united"

  readonly property string homeRed: "#dc1f26"
  readonly property string awayBlue: "#0845ba"
  readonly property string label: String(setting("label", "UNITED"))
  readonly property string pluginId: "io.github.anujraja.manchester-united"

  implicitWidth: badge.implicitWidth
  implicitHeight: badge.implicitHeight

  Row {
    id: badge
    spacing: Style.space(6)
    height: root.barSize

    Column {
      anchors.verticalCenter: parent.verticalCenter
      spacing: 0
      width: Style.space(6)
      height: Math.max(Style.space(14), root.barSize - Style.space(10))

      Rectangle {
        width: parent.width
        height: parent.height / 2
        color: root.homeRed
      }
      Rectangle {
        width: parent.width
        height: parent.height / 2
        color: root.awayBlue
      }
    }

    Text {
      visible: !root.vertical
      anchors.verticalCenter: parent.verticalCenter
      text: root.label
      color: root.bar ? root.bar.barForeground : Color.foreground
      font.family: root.bar ? root.bar.fontFamily : Style.font.family
      font.pixelSize: Style.font.body
      font.bold: true
      font.letterSpacing: 1.2
    }
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
    cursorShape: Qt.PointingHandCursor

    onClicked: function(mouse) {
      if (!root.bar) return
      if (mouse.button === Qt.RightButton)
        root.bar.run("omarchy theme bg next")
      else if (mouse.button === Qt.MiddleButton)
        root.bar.run("omarchy-shell shell hide " + root.pluginId)
      else
        root.bar.run("omarchy-shell shell toggle " + root.pluginId)
    }
    onEntered: if (root.bar) root.bar.showTooltip(root, "Manchester United")
    onExited: if (root.bar) root.bar.hideTooltip(root)
  }
}

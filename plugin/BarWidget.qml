import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "user.dev-workflows"

  property string activeIcon: "󰚩"
  property string activeName: "AI-Assisted Prototyping"

  function refresh() {
    if (!probeProc.running) probeProc.running = true
  }

  function openMenu() {
    if (root.bar) {
      root.bar.run("omarchy-workflow-menu")
    }
  }

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  Process {
    id: probeProc
    command: ["bash", "-c", "echo \"$(omarchy-workflow get-icon)|||$(omarchy-workflow get-name)\""]
    stdout: SplitParser {
      onRead: function(line) {
        var raw = String(line).trim()
        if (raw.indexOf("|||") !== -1) {
          var parts = raw.split("|||")
          if (parts[0]) root.activeIcon = parts[0]
          if (parts[1]) root.activeName = parts[1]
        }
      }
    }
  }

  Timer {
    id: pollTimer
    interval: 2500
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: root.refresh()
  }

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.activeIcon
    active: true
    tooltipText: "Dev Workflow: " + root.activeName + "\nClick to switch workflows or launch stack tools"
    onPressed: function(b) {
      root.openMenu()
    }
  }
}

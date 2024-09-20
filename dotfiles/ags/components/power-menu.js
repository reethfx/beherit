import { ButtonLabel } from "./button-label.js";
import { ItemNarrow } from "./item.js";

const PowerButton = (label, typeButtonClass, onClicked) => Widget.Box({child: ButtonLabel(
  label,
  {
    class_name: `power-button ${typeButtonClass}`,
    onClicked
  },
  "label-big",
),});

const PowerMenu = (monitor = 0) => Widget.Window({
  monitor,
  name: `power-menu-${monitor}`,
  class_name: "window",
  visible: false,
  child: Widget.Box({
    css: "padding: 1px",
    spacing: 8,
    children: [
      PowerButton(
        "󰐥",
        "power-button--poweroff",
        () => {Utils.exec("poweroff")},
      ),
      PowerButton(
        "",
        "power-button--reboot",
        () => {Utils.exec("reboot")},
      ),
      PowerButton(
        "󰒲",
        "power-button--suspend",
        () => {},
      ),
    ],
  }),
})

// Add it like this to the App config to allow
// access to the button to its properties
const powerMenu = PowerMenu();
App.addWindow(powerMenu);

export const OpenPowerMenuButton = () => ItemNarrow([
  ButtonLabel(
    "𒉭",
    {
      onClicked: () => {
        powerMenu.visible = !powerMenu.visible;
      },
    },
  ),
]);
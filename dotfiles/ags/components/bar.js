import { Workspaces } from "./workspaces.js";
import { Clock } from "./clock.js";
import { Title } from "./title.js";
import { Audio } from "./audio.js";
import { ItemNarrow } from "./item.js";
import { ButtonLabel } from "./button-label.js";
import { OpenPowerMenuButton } from "./power-menu.js";

const Left = () => Widget.Box({
  spacing: 8,
  children: [
    OpenPowerMenuButton(),
  ],
});

const Center = () => Widget.Box({
  children: [
    Workspaces(),
  ],
});

const Right = () => Widget.Box({
  hpack: "end",
  spacing: 8,
  children: [
    ...Audio(),
    Clock(),
  ],
});

export const Bar = (monitor = 0) => Widget.Window({
  monitor,
  name: `bar-${monitor}`,
  class_name: "window",
  anchor: ["top", "left", "right"],
  // Bottom margin will be made automatically by Hyprland
  margins: [ 6, 6, 0, 6 ],
  exclusivity: "exclusive",
  child: Widget.CenterBox({
    start_widget: Left(),
    center_widget: Center(),
    end_widget: Right(),
  }),
});
import { ItemNarrow } from "./item.js";

const hyprland = await Service.import("hyprland")

export function Workspaces() {
  const activeWorkspaceId = hyprland.active.workspace.bind("id")
  const workspaces = hyprland.bind("workspaces").as(
    workspaces => {
      workspaces.sort((a, b) => a.id - b.id);

      return workspaces.map(
        ({ id }) => Widget.Button({
          on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
          child: Widget.Label({
            label: `${id}`,
            class_name: activeWorkspaceId.as(
              activeId => activeId == id ? "label-active" : "label-inactive"
            ),
          }),
          class_name: "button",
        })
      );
    }
  );

  return ItemNarrow(workspaces);
};
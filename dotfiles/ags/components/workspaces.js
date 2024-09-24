import { ItemNarrow } from "./item.js";

const toKanji = (num) => {
  const kanjiMap = {
    1: '一',
    2: '二',
    3: '三',
    4: '四',
    5: '五',
    6: '六',
    7: '七',
    8: '八',
    9: '九',
    10: '十'
  };
  return kanjiMap[num] || num; 
};

const hyprland = await Service.import("hyprland");

export function Workspaces() {
  const activeWorkspaceId = hyprland.active.workspace.bind("id");
  
  const allWorkspaces = Array.from({ length: 6 }, (_, i) => i + 1);

  const workspaces = hyprland.bind("workspaces").as(() => {
    return allWorkspaces.map(id => Widget.Button({
      on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
      child: Widget.Label({
        label: toKanji(id),
        class_name: activeWorkspaceId.as(
          activeId => activeId == id ? "label-active" : "label-inactive"
        ),
      }),
      class_name: "button",
    }));
  });

  return ItemNarrow(workspaces);
};

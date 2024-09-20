import { ItemNarrow } from "./item.js";

// Función para convertir números a números romanos
const toRoman = (num) => {
  const romanMap = [
    [1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'],
    [100, 'C'], [90, 'XC'], [50, 'L'], [40, 'XL'],
    [10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I']
  ];
  let result = '';
  for (const [value, symbol] of romanMap) {
    while (num >= value) {
      result += symbol;
      num -= value;
    }
  }
  return result;
};

const hyprland = await Service.import("hyprland");

export function Workspaces() {
  const activeWorkspaceId = hyprland.active.workspace.bind("id");
  
  // Forzamos que siempre se muestren los 6 workspaces
  const allWorkspaces = Array.from({ length: 6 }, (_, i) => i + 1);

  const workspaces = hyprland.bind("workspaces").as(() => {
    return allWorkspaces.map(id => Widget.Button({
      on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
      child: Widget.Label({
        label: toRoman(id), // Mostrar el número romano
        class_name: activeWorkspaceId.as(
          activeId => activeId == id ? "label-active" : "label-inactive"
        ),
      }),
      class_name: "button",
    }));
  });

  return ItemNarrow(workspaces);
};

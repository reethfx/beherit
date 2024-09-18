export const ButtonLabel = (label, buttonProperties = {}, labelClass = "label-active") => Widget.Button({
    class_name: "button",
    child: Widget.Label({
      class_name: labelClass,
      label: label,
    }),
    ...buttonProperties,
  })
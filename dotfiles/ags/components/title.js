const hyprland = await Service.import('hyprland')

export const Title = () => Widget.Box({
  class_name: "item--wide",
  children: [
    Widget.Label({
      class_name: "label-active",
      label: hyprland.active.client.bind("title").as(
        title => {
          if (title === "") {
            return "Nubosa";
          };

          if (title.length < 45) {
            return title;
          };

          return title.substring(0, 43) + "...";
        }
      )
    })
  ],
})
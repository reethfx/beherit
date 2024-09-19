import { ButtonLabel } from "./button-label.js";
import { ItemNarrow } from "./item.js";

const notifications = await Service.import("notifications");

const NotificationPopupTitle = summary => Widget.Label({
  label: summary,
  class_name: "label-active",
  justification: "left",
  xalign: 0,
  use_markup: true,
});

const NotificationPopupBody = body => Widget.Label({
  label: body,
  justification: "left",
  xalign: 0,
  maxWidthChars: 35,
  wrap: true,
  use_markup: true,
})

const NotificationPopupText = notification => Widget.Box({
  vertical: true,
  children: [
    NotificationPopupTitle(notification.summary),
    NotificationPopupBody(notification.body),
  ]
});

const NotificationIcon = ({ app_entry, app_icon, image }) => {
  if (image) {
      return Widget.Box({
        class_name: "notification-icon",
        css: `background-image: url("${image}");`
              + "background-size: contain;"
              + "background-repeat: no-repeat;"
              + "background-position: center;",
      })
  }

  let icon = null;
  if (Utils.lookUpIcon(app_icon)) {
      icon = app_icon;
  }

  if (app_entry && Utils.lookUpIcon(app_entry)) {
      icon = app_entry;
  }

  if (!icon) {
    return;
  }

  return Widget.Box({
      class_name: "notification-icon",
      child: Widget.Icon(icon),
  })
}

const NotificationActionButtons = notification => Widget.Box({
  children: notification.actions.map(({ id, label }) => Widget.Button({
    class_name: "notification-action-buttons",
    on_clicked: () => {
      notification.invoke(id);
      notification.dismiss();
    },
    child: Widget.Label(label),
    hexpand: true,
  }))
});

const NotificationPopup = notification => Widget.EventBox({
  attribute: { id: notification.id },
  on_primary_click: notification.dismiss,
  on_secondary_click: notification.dismiss,
  child: Widget.Box({
    vertical: true,
    class_name: "notification",
    children: [
      Widget.Box({
        children: [
          NotificationIcon(notification),
          NotificationPopupText(notification),
        ],
      }),
      NotificationActionButtons(notification),
    ],
  })
});

const list = Widget.Box({
  vertical: true,
});

function onNotified(_, id) {
  const notification = notifications.getNotification(id);
  if (!notification) {
    return;
  };

  list.children = [NotificationPopup(notification) , ...list.children];
}

function onDismissed(_, id) {
  list.children.find(n => n.attribute.id === id)?.destroy()
}

list.hook(notifications, onNotified, "notified")
    .hook(notifications, onDismissed, "dismissed");

export const Notifications = (monitor = 0) => Widget.Window({
  monitor,
  name: `notifications-${monitor}`,
  class_name: "window",
  anchor: ["top", "right"],
  margins: [4, 4, 0, 0],
  child: Widget.Box({
    css: "padding: 1px;",
    class_name: "notifications",
    vertical: true,
    child: list,
  }),
});
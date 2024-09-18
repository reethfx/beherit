import { ButtonLabel } from "./button-label.js";
import { ItemNarrow } from "./item.js";

const hour = Variable("", {
  poll: [1000, 'date "+%H:%M"'],
});

const date = Variable("", {
  poll: [86400, 'date "+%d.%m.%Y"'],
});


const popupState = Variable(false);

const PopupButton = label => ButtonLabel(
  label,
  {
    onClicked: () => {
      popupState.value = !popupState.value;
    },
  }
);

const DatePopup = Widget.Revealer({
    revealChild: popupState.bind(),
    transition: 'slide_right',
    transitionDuration: 100,
    child: ItemNarrow([
      PopupButton(date.bind().as(
        date => `󰃭  ${date}`
      )),
    ]),
})

const ClockItem = ItemNarrow([
  PopupButton(hour.bind().as(
    hour => `  ${hour}`
  )),
]);

export const Clock = () => Widget.Box({
  spacing: popupState.bind().as(
    state => state ? 8 : 0
  ),
  children: [
    DatePopup,
    ClockItem,
  ],
});
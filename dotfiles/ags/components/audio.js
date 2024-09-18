import { ButtonLabel } from "./button-label.js";
import { ItemNarrow } from "./item.js";

const audio = await Service.import('audio')

const AudioItem = (source, icon, zeroIcon) => {
  return ItemNarrow([
    ButtonLabel(
      audio[source].bind("volume").as(
        volume => {
          const percentage = Math.round(volume * 100);

          return `${volume > 0 ? icon : zeroIcon}  ${percentage}%`
        }
      ),
      {
        onScrollUp: () => {
          if (audio[source].volume >= 1) {
            audio[source].volume = 1;
            
            return;
          };

          audio[source].volume += 0.01;
        }, 
        onScrollDown: () => audio[source].volume -= 0.01,
        onPrimaryClick: () => audio[source].volume = 1,
        onSecondaryClick: () => audio[source].volume = 0,
      },
      audio[source].bind("volume").as(
        volume => volume !== 0 ? "label-active" : "label-danger"
      ),
    ),
  ]);
};

export const Audio = () => [
  AudioItem("speaker", "", ""),
  AudioItem("microphone", "", ""),
]
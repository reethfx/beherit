import { Bar } from "./components/bar.js";
import { Notifications } from "./components/notifications.js"

const css_file_path = `${App.configDir}/style.css`;
App.config({
  windows: [
    Bar(),
    Notifications(),
  ],
  style: css_file_path,
});

Utils.monitorFile(
    css_file_path,
    function() {
        App.applyCss(css_file_path);
    },
)
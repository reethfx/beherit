{ ... }:
{
  xdg.configFile."fastfetch/config.conf".text = ''
  {
  "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
  "modules": [
    "title",
    "separator",
    {
      "type": "os",
      "format": "{name} {version}"
    },
    {
      "type": "cpu",
      "format": "{name} - {cores} cores"
    },
    {
      "type": "gpu",
      "format": "{name}"
    },
    {
      "type": "memory",
      "format": "{used} / {total}"
    },
    {
      "type": "storage",
      "format": "{used} / {total} on {mountPoint}"
    },
    {
      "type": "uptime",
      "format": "{days}d {hours}h {minutes}m"
    }
  ]
}

}

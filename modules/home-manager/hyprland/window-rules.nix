[
  # Make Picture-in-Picture sticky
   "float, title:Picture-in-Picture"
   "pin, title:Picture-in-Picture"
   "move 5 51, title:Picture-in-Picture"
   "size 35% 35%, title:Picture-in-Picture"

  #Temporally force some apps to go to workspace in particular,
  # it will by reverted by the script `revert-startup-apps-window-rules
   "workspace 3 silent, class:code"
   "workspace 4 silent, class:vesktop"
   "workspace 5 silent, class:spotify"
]
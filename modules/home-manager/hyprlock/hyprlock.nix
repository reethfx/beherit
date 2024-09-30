{ ... }: 
{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                hide_cursor = true;
                require_password = true; 
                no_fade_in = false;
                ignore_mouse_movement = true;
                grace = 0;
            };

            background = [
                {
                path = "~/.config/wallpaper/bersrkarch.png";
                blur_passes = 3;
                blur_size = 4;
                }
            ];

            # label = [
            # {
            #    text = cmd[update:1000] echo "<span>$(date '+%H:%M:%S')</span>";
            #    color = "rgba(0, 0, 0, 1.0)";
            #    font-size = 32;
            #    position = "0, 10";
            # }
            # ];

            input-field = [
                {
                size = "200, 50";
                position = "0, -80";
                monitor = "";
                dots_center = true;
                fade_on_empty = false;
                font_color = "rgb(202, 211, 245)";
                inner_color = "rgb(91, 96, 120)";
                outer_color = "rgb(24, 25, 38)";
                outline_thickness = 3;
                shadow_passes = 2;
                }
            ];

            label = [
            {
                text = "i must keep winning to attain my dream.";
                font-size = 22;
                color = "rgb(221, 120, 120)";
                position = "0, 50";
                halign = "center";
            }
            ];
        };
    };
}
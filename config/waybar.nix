{ programs.waybar = {

enable = true;

settings = [{
    #margin-top = -4;
    #margin-bottom = -14;

    #height = 0; # Waybar height (to be removed for auto height)
    spacing = 10; # Gaps between modules
    
    modules-left = ["wlr/workspaces"];
    modules-center = [];
	modules-right =  ["idle_inhibitor" "pulseaudio" "network" "backlight" "battery" "clock" "tray"];
 
    "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
            "activated" = "";
            "deactivated" = "";
        };
    };
	
    "tray" = {
    	icon-size = 15;
        spacing = 10;
    };

    "clock" = {
		timezone = "America/New_York"; 
        format = "{:%I:%M %p}";
        format-alt = "{:%e\\%d\\%Y}";
    };

    "backlight" = {
        device = "acpi_video1";
        format = "{percent}% {icon}";
    	format-icons = ["" "" "" "" "" "" "" "" ""];
    };

    "battery" = {
        states = {
            "warning" = 30;
            "critical" = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% 󰂄";
        format-plugged = "{capacity}% ";
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    };
    
    "network" = {
        format-wifi = "{icon}";
    	format-icons = ["󰤟" "󰤥" "󰤨"];
    	format-ethernet = "{ethernet}";
        format-disconnected = "󰤮";
        on-click = "hyprctl dispatch exec '[float]iwgtk'";
    };

    "pulseaudio" = {
        format = "{volume}% {icon}";
        format-icons = ["" "" ""];
        on-click = "hyprctl dispatch exec '[float]pavucontrol'";
    };

    "wlr/workspaces" = {
        format = "{name}";
        active-only = true;
    };
}];

style = ''
window#waybar {
	font-weight: bold;
	background: rgba(60, 43, 94, 0.4);
	color: #D9D9D9;
	font-family: 'JetBrainsMono Nerd Font';
}

/* Workspace numbers */
#workspaces button {
	font-weight: bold;
	color: #D9D9D9;
	border: none;
	border-radius: 0;
	transition-duration: 0.1s;
	transition-property: background;
	box-shadow: none;
}

#workspaces button:hover {
	font-weight: bold;
	text-shadow: none;
}

#workspaces button.active {
	background: rgba(40, 1, 78, 0);
}

#idle_inhibitor, #pulseaudio, #network, #backlight, #battery, #clock, #tray {
	/*background: red;*/
	padding: 0 10px;
}
'';

};}

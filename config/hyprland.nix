{ wayland.windowManager.hyprland = {

enable = true;
extraConfig = ''
# =========================================
# ========= Monitor Configuration =========
# =========================================

exec-once = hyprpaper
exec-once = waybar
exec-once = dunst
exec-once = /usr/lib/polkit-kde-authentication-agent-1
exec-once = copyq

exec-once = swyaidle -w timeout 5 'systemctl suspend' & disown

# Setup monitors
monitor=,preferred,auto,1

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us

    follow_mouse = 2

    touchpad {
        natural_scroll = yes
        drag_lock = true
        clickfinger_behavior = true
    }

    sensitivity = -0.6
    force_no_accel = true

}

general {
    gaps_in = 5
    gaps_out = 10
    border_size = 0

    resize_on_border = true
    layout = dwindle

    col.group_border = rgba(0083FF55)
    col.group_border_active = rgba(2997FFFF)
}

decoration {
    rounding = 5
    blur = true
    blur_size = 3
    blur_passes = 3
    blur_new_optimizations = on

    dim_inactive = true
    dim_strength = 0
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 2, myBezier
    animation = windowsOut, 1, 1, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 2, default
}

dwindle {
    pseudotile = yes
    preserve_split = yes # you probably want this
    use_active_for_splits = true
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = on
}

misc {
    vfr = true
    disable_hyprland_logo = true
}


binds {
    allow_workspace_cycles = true
}

$mod = SUPER

# =========================================
# ============= Window Rules ==============
# =========================================

windowrule = fullscreen, ^(rofi)$


# =========================================
# =========== Open Common Apps ============
# =========================================

# fixes GTK apps delayed on NixOS startup
exec-once=dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY

bind = $mod, return, exec, alacritty
bind = $mod, p, exec, chromium
bind = $mod, o, exec, nautilus
bind = $mod, space, exec, fuzzel 

# =========================================
# ========== Modify Active Window =========
# =========================================

bind = $mod, q, killactive
bind = $mod, d, togglefloating
bind = $mod, f, fullscreen
bind = $mod SHIFT, f, fakefullscreen
bind = $mod, s, exec, grim -g "$(slurp)" -t png "/home/$USER/pictures/$(date '+%d%m%Y-%H%S%M')".png

# Move focused window
bind = $mod SHIFT, h, movewindow, l
bind = $mod SHIFT, j, movewindow, d
bind = $mod SHIFT, k, movewindow, u
bind = $mod SHIFT, l, movewindow, r
bindm = $mod, mouse:272, movewindow

# Resize
bind=$mod, r, submap, resize
submap = resize

    binde =, h, resizeactive, -10 0
    binde =, j, resizeactive, 0 10
    binde =, k, resizeactive, 0 -10
    binde =, l, resizeactive, 10 0

    bind = $mod, h, movefocus, l
    bind = $mod, j, movefocus, d 
    bind = $mod, k, movefocus, u
    bind = $mod, l, movefocus, r

    bind =, escape, submap, reset

submap = reset

# =========================================
# ============= Change Focus ==============
# =========================================

bind = $mod, h, movefocus, l
bind = $mod, j, movefocus, d 
bind = $mod, k, movefocus, u
bind = $mod, l, movefocus, r

bind = $mod, TAB, changegroupactive, f
bind = $mod SHIFT, TAB, changegroupactive, b

# =========================================
# ============= Workspaces ================
# =========================================

bind = $mod, 1, workspace, 1
bind = $mod, 2, workspace, 2
bind = $mod, 3, workspace, 3
bind = $mod, 4, workspace, 4
bind = $mod, 5, workspace, 5
bind = $mod, 6, workspace, 6
bind = $mod, 7, workspace, 7
bind = $mod, 8, workspace, 8
bind = $mod, 9, workspace, 9
bind = $mod, 0, workspace, 10

bind = $mod SHIFT, 1, movetoworkspace, 1
bind = $mod SHIFT, 2, movetoworkspace, 2
bind = $mod SHIFT, 3, movetoworkspace, 3
bind = $mod SHIFT, 4, movetoworkspace, 4
bind = $mod SHIFT, 5, movetoworkspace, 5
bind = $mod SHIFT, 6, movetoworkspace, 6
bind = $mod SHIFT, 7, movetoworkspace, 7
bind = $mod SHIFT, 8, movetoworkspace, 8
bind = $mod SHIFT, 9, movetoworkspace, 9
bind = $mod SHIFT, 0, movetoworkspace, 10

# =========================================
# ================ Groups =================
# =========================================

bind = $mod CTRL, h, moveintogroup, l
bind = $mod CTRL, j, moveintogroup, d 
bind = $mod CTRL, k, moveintogroup, u
bind = $mod CTRL, l, moveintogroup, r

bind = $mod SHIFT, d, togglegroup

# ========================================
# =============== X Events ===============
# ========================================

binde = , XF86AudioRaiseVolume,     exec, ~/.config/hypr/commands.fish 'volume-up'
binde = , XF86AudioLowerVolume,     exec, ~/.config/hypr/commands.fish 'volume-down'
binde = , XF86AudioMute,            exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
#binde = , XF86MonBrightnessUp,      exec, light -A 5
#binde = , XF86MonBrightnessDown,    exec, light -U 5
'';

};

xdg.configFile."hypr/hyprpaper.conf".text = "
preload = ~/documents/wallpapers/w9.jpg
wallpaper = ,~/documents/wallpapers/w9.jpg
";
}

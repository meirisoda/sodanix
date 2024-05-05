{ hostname, ... }:
let
  wallpaper = ./wallpaper/infobar.png;
  pfp = ./wallpaper/pfp.png;
in
''
background {
    monitor =
    path = ${wallpaper}
    rgba(200, 200, 200, 0.5)
    vibrancy_darkness = 0.0
}
# image {
#     monitor =
#     path = ${pfp}
#     size = 150 # lesser side if not 1:1 ratio
#     rounding = -1 # negative values mean circle
#     border_size = 1
#     border_color = rgb(119, 119, 119)
#     rotate = 0 # degrees, counter-clockwise
#     reload_time = -1 # seconds between reloading, 0 to reload with SIGUSR2
#     reload_cmd =  # command to get new path. if empty, old path will be used. don't run "follow" commands like tail -F

#     position = 0, 100
#     halign = center
#     valign = center
# }
label {
    monitor =
    text = $USER
    color = rgba(119, 119, 119, 1.0)
    font_size = 18
    font_family = monospace

    position = 0, 80
    halign = center
    valign = center
}
input-field {
    monitor =
    size = 200, 50
    outline_thickness = 1
    dots_size = 0.2
    dots_spacing = 0.15
    dots_center = false
    dots_rounding = -1
    outer_color = rgb(0, 0, 0)
    inner_color = rgb(255, 255, 255)
    font_color = rgb(0,0,0)
    fade_on_empty = true
    fade_timeout = 1000
    placeholder_text = <i>Input Password...</i>
    hide_input = false
    rounding = 0
    check_color = rgb(204, 136, 34)
    fail_color = rgb(204, 34, 34)
    fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
    fail_transition = 300
    capslock_color = -1
    numlock_color = -1
    bothlock_color = -1
    invert_numlock = false

    position = 0, -20
    halign = center
    valign = center
}
''
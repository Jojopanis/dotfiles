--  _   __           _     _           _ _                 
-- | | / /          | |   (_)         | (_)                
-- | |/ /  ___ _   _| |__  _ _ __   __| |_ _ __   __ _ ___ 
-- |    \ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|
-- | |\  \  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
-- \_| \_/\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
--              __/ |                             __/ |    
--             |___/                             |___/     

local terminal    = "kitty"
local fileManager = "yazi"
local menu        = "rofi -show drun -show-icons"

local mainMod = "SUPER"

-- Fullscreen --
hl.bind(mainMod .. ' + F', hl.dsp.window.fullscreen({mode = 'maximized', action = 'toggle'}))
hl.bind(mainMod .. ' + SHIFT + F', hl.dsp.window.fullscreen({mode = 'fullscreen', action = 'toggle'}))

-- Scrolling mode navigation
hl.bind(mainMod .. " + mouse_up",  hl.dsp.layout('move +col'))
hl.bind(mainMod .. " + mouse_down",  hl.dsp.layout('move -col'))

hl.bind(mainMod .. " + L",  hl.dsp.layout('move +col'))
hl.bind(mainMod .. " + H",  hl.dsp.layout('move -col'))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
hl.unbind(mainMod .. " + 1")
hl.unbind(mainMod .. " + 2")
hl.bind(mainMod .. " + 1", hl.dsp.focus({monitor = "DP-1"}))
hl.bind(mainMod .. " + 2", hl.dsp.focus({monitor = "DP-2"}))

-- Special workspaces
hl.bind(mainMod .. " + D",         hl.dsp.workspace.toggle_special("discord"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:discord" }))
-- Small windowrule to catch when vesktop opens in another workspace
hl.window_rule({ match = {initial_class = "vesktop"}, workspace = "special:discord"})
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + CTRL + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

--  _            _       
-- | |          | |      
-- | |_ ___   __| | ___  
-- | __/ _ \ / _` |/ _ \ 
-- | || (_) | (_| | (_) |
--  \__\___/ \__,_|\___/ 
-- These are still the basic keybinds in the default config

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only --freeze"))

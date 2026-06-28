-- Utility Functions

--(function()
--    local a = { "left", "down", "up", "right" }
--    local b = { "h", "j", "k", "l" }
--    for x = 1, #a do
--	hl.bind("SUPER + " .. a[x],hl.dsp.focus({ direction = b[x] }))
--    end
--end)()

--local zip_tables = function (...)
--    local arg = table.pack(...)
--    for x = 1, #table[1] do
--	f(table.unpack())
--    end
--end

hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + C", hl.dsp.window.kill())
hl.bind("SUPER + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + ALT + Return", hl.dsp.exec_cmd("kitty --detach -1 nvim $HOME/mysystem; kitty --detach -1 $HOME/mysystem"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind("SUPER + Q", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + ALT + M", hl.dsp.exec_cmd("uwsm stop"))

hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + N", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + SHIFT + P", hl.dsp.window.pin())

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- submaps
hl.bind("SUPER + SHIFT + S", hl.dsp.submap("screenshot"))
hl.bind("SUPER + escape", hl.dsp.submap("pass"))

hl.define_submap("screenshot", function()
    hl.bind("S", hl.dsp.exec_cmd("hyprshot -m region -z --clipboard-only"))
    hl.bind("SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -z -o ~/stuff"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.define_submap("pass", function()
    hl.bind("SUPER + escape", hl.dsp.submap("reset"))
end)

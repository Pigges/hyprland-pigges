hl.bind("SUPER + W", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/lockscreen.sh"))
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd("hyprpicker -a -n"))

-- Brightness
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 0.0 @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- Screenshots
hl.bind(
	"SUPER + SHIFT + S",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprshot.sh -m region -o $(xdg-user-dir PICTURES)/Screenshots")
)
hl.bind(
	"Print",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprshot.sh -m output -o $(xdg-user-dir PICTURES)/Screenshots")
)
hl.bind("ALT + Print", hl.dsp.exec_cmd("grimblast --notify --cursor copysave screen"))

-- Snippets
hl.bind("SUPER + INSERT", hl.dsp.exec_cmd("~/.config/hypr/scripts/snippetsmenu"))

-- =========================
-- Apps / launchers
-- =========================
hl.bind("SUPER + E", hl.dsp.exec_cmd("nemo"))
hl.bind("SUPER + P", hl.dsp.exec_cmd(launcher))

hl.bind(
	"SUPER + period",
	hl.dsp.exec_cmd(
		"killall rofi || rofi -show emoji -emoji-format '{emoji}' -modi emoji -theme ~/.config/rofi/global/emoji"
	)
)

hl.bind("SUPER + escape", hl.dsp.exec_cmd("wlogout --protocol layer-shell -b 5 -T 400 -B 400"))

hl.bind("SUPER + K", hl.dsp.exec_cmd("~/.config/hypr/scripts/showkeys.sh"))
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd("killall wshowkeys"))

-- =========================
-- Window management
-- =========================
hl.bind("SUPER + SHIFT + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-hyprbars.sh"))

-- =========================
-- Focus movement
-- =========================
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- =========================
-- Move window
-- =========================
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- =========================
-- Resize window
-- =========================
hl.bind("SUPER + CTRL + left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
hl.bind("SUPER + CTRL + up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind("SUPER + CTRL + down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))

-- =========================
-- Workspaces
-- =========================
local smw = hl.plugin.split_monitor_workspaces

for i = 1, 10 do
	local key = "code:" .. tostring(i + 9)
	hl.bind("SUPER + " .. key, function()
		return smw.workspace(i)
	end)
	hl.bind("SUPER + SHIFT + " .. key, function()
		return smw.move_to_workspace(i)
	end)
end

hl.bind("SUPER + ALT + up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + ALT + down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + TAB", hl.dsp.focus({ workspace = "previous" }))

-- =========================
-- Mouse bindings
-- =========================
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- =========================
-- Gestures (Lua table style usually)
-- =========================
hl.gestures = {
	workspace_swipe_invert = false,
	workspace_swipe_forever = true,
	workspace_swipe_use_r = true,

	gesture = {
		{ fingers = 3, direction = "horizontal", action = "workspace" },

		{ fingers = 3, direction = "down", dispatcher = "hyprexpo:expo", action = "toggle" },
		{ fingers = 3, direction = "up", dispatcher = "hyprexpo:expo", action = "select" },
	},
}

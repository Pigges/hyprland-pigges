-- Steam rules
rules.window("steam", { float = true, idle_inhibit = "fullscreen" })
rules.window({ class = "steam", title = "Steam" }, { center = true, size = { 1100, 700 } })
rules.window("steam.*", { tag = "-default-opacity", opacity = "1 1" })
rules.window({ class = "steam", title = "Friends List" }, { size = { 460, 800 } })

-- RetroArch rules
rules.window("com.libretro.RetroArch", {
	fullscreen = true,
	tag = "-default-opacity",
	opacity = "1 1",
	idle_inhibit = "fullscreen",
})

-- Picture-in-picture overlays.
rules.window({ title = "(Picture.?in.?[Pp]icture)" }, { tag = "+pip" })
rules.window({ tag = "pip" }, {
	tag = "-default-opacity",
	float = true,
	pin = true,
	size = { 600, 338 },
	keep_aspect_ratio = true,
	border_size = 0,
	opacity = "1 1",
	move = { "(monitor_w-window_w-40)", "(monitor_h*0.04)" },
})

-- Qemu rules
rules.window("qemu", { tag = "-default-opacity", opacity = "1 1" })

-- Define terminal tag to style them uniformly.
rules.window("(Alacritty|kitty|com.mitchellh.ghostty|foot)", { tag = "+terminal" })
rules.window({ tag = "terminal" }, { tag = "-default-opacity", opacity = "0.97 0.9" })

-- System rules
rules.window({ tag = "floating-window" }, { float = true, center = true, size = { 875, 600 } })

rules.window(
	"(org.omarchy.bluetui|org.omarchy.impala|org.omarchy.wiremix|org.omarchy.btop|org.omarchy.terminal|org.omarchy.bash|org.codeberg.dnkl.foot|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|Omarchy|About|TUI.float|imv|mpv)",
	{ tag = "+floating-window" }
)
rules.window({
	class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)",
	title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)",
}, { tag = "+floating-window" })
rules.window("org.gnome.Calculator", { float = true })
-- Common app-controlled tags.
rules.window({ tag = "pop" }, { rounding = 8 })
rules.window({ tag = "noidle" }, { idle_inhibit = "always" })

-- No transparency on media windows
rules.window(
	"^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$",
	{ tag = "-default-opacity", opacity = "1 1" }
)

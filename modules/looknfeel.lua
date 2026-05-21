-- =========================
-- GENERAL
-- =========================
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 9,
		border_size = 1,
		gaps_workspaces = 50,

		col = {
			active_border = "rgb(0088FF)",
			inactive_border = "rgba(FFFFFFCC)",
		},

		resize_on_border = true,
		allow_tearing = true,
		layout = "master",

		snap = {
			enabled = true,
		},
	},

	-- =========================
	-- MISC
	-- =========================
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		enable_swallow = true,
		swallow_regex = "^(Alacritty)$",
		middle_click_paste = false,
		focus_on_activate = true,
	},

	-- =========================
	-- DECORATION
	-- =========================
	decoration = {
		rounding = 4,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		blur = {
			enabled = true,
			size = 3,
			passes = 3,
			new_optimizations = true,
			ignore_opacity = true,
			brightness = 0.8,
			vibrancy_darkness = 1.0,
			contrast = 1.0,
		},

		shadow = {
			enabled = true,
		},
	},

	-- =========================
	-- CURSOR
	-- =========================
	cursor = {
		hide_on_key_press = true,
	},

	animations = {
		enabled = false,

		beziers = {
			overshot = { 0.05, 0.9, 0.1, 1.05 },
			smoothOut = { 0.36, 0, 0.66, -0.56 },
			smoothIn = { 0.25, 1, 0.5, 1 },
		},

		animations = {
			{ "windows", 1, 5, "overshot", "popin" },
			{ "windowsOut", 1, 4, "smoothOut", "popin" },
			{ "windowsMove", 1, 4, "default" },
			{ "border", 1, 10, "default" },
			{ "fade", 1, 10, "smoothIn" },
			{ "fadeDim", 1, 10, "smoothIn" },
			{ "workspaces", 1, 6, "default" },
		},
	},

	dwindle = {
		preserve_split = true,
	},

	plugin = {
		split_monitor_workspaces = {
			count = 10,
			keep_focused = 1,
			enable_notifications = 0,
			enable_persistent_workspaces = 0,
		},
	},
})

hl.layer_rule({
	match = { namespace = "gtk-layer-skell" },
	blur = true,
})
hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
	blur_popups = true,
	ignore_alpha = 0.2,
})
hl.layer_rule({
	match = { namespace = "vicinae" },
	blur = true,
	ignore_alpha = 0,
	no_anim = true,
})

hl.layer_rule({
	name = "notifications",
	match = { namespace = "notifications" },
	ignore_alpha = true,
	animation = "popin 80%",
})

hl.window_rule({
	match = {
		class = "(file_progress|confirm|dialog|download|notification|error|splash|confirmreset|file-roller|Lxappearance)",
	},
	float = true,
})
hl.window_rule({
	match = { title = "title:(Open File|branchdialog)", class = "class:(viewnior|feh)" },
	float = true,
})

hl.window_rule({
	match = { class = "(pavucontrol|pavucontrol-qt|org.pulseaudio.pavucontrol)" },
	float = true,
	size = "800 600",
	move = "75 44%",
})

hl.window_rule({
	match = { title = "^(Media viewer)$" },
	float = true,
})

hl.window_rule({
	match = { class = "class:^(Rofi)$" },
	float = true,
	no_anim = true,
})

hl.window_rule({
	match = { class = "^(mpv)$" },
	idle_inhibit = "focus",
})

hl.window_rule({
	match = { class = "^(wlogout)$" },
	float = true,
	fullscreen = true,
})

hl.window_rule({
	match = { class = "^(code-oss|Code)$" },
	opacity = "0.9 0.9",
	no_blur = true,
})

hl.window_rule({
	match = { class = "^(Spotify)$" },
	size = "85% 85%",
	center = true,
	opacity = "0.9 0.8",
	workspace = 5,
	no_blur = true,
})

hl.window_rule({
	match = { class = "^(discord|vesktop)$" },
	opacity = "0.9 0.75",
})

hl.window_rule({
	match = { class = "^(Element)$" },
	opacity = "0.9 0.8",
	no_blur = true,
})

hl.window_rule({
	match = { class = "^(Alacritty)$" },
	opacity = "0.8",
})

hl.window_rule({
	name = "file-manager",
	match = { class = "nemo" },
	opacity = "0.7 0.7",
	xray = true,
	decorate = true,
})

hl.window_rule({
	match = { class = "^(koodo-reader)$" },
	opacity = "0.8 0.75",
})

hl.window_rule({
	match = { title = "[Ww]ebcam" },
	float = true,
	move = "100%-340 100%-260",
	size = "320 240",
	opacity = "0.75",
	pin = true,
})

hl.window_rule({
	match = { class = "^(steam_app_1808500)$" },
	fullscreen = true,
	stay_focused = true,
})

hl.window_rule({
	match = { class = "hyprpolkitagent" },
	float = true,
	center = true,
	opacity = 0.5,
	size = { 500, 350 },
	rounding = 20,
	animation = "popin",
})

hl.window_rule({
	match = { class = "^(cs2)$" },
	immediate = true,
})

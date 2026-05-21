hl.window_rule({
	name = "general-window-rules",

	match = { class = ".*" },

	suppress_event = "maximize",

	-- active inactive
	opacity = "0.97 0.9",
})

-- Fix some dragging issues with XWayland.
hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- App-specific tweaks (may remove default-opacity tag).
require("modules.apps")

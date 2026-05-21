-- Define variables
terminal = "alacritty"
browser = "zen-browser"
launcher = "(vicinae toggle) || (hyprlauncher) || (killall bemenu-run || bemenu-run -l 20)"

-- Load helper functions
require("helper")

-- Load all modules
require("modules.all")

--hl.dsp.exec_cmd("~/.config/hypr/scripts/configure-split-monitor-workspaces.sh")

-- Custom config
require("monitors")
require("custom")

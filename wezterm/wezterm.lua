local wezterm = require "wezterm"

local font_primary = "Fira Code"
require("tab-title").setup()

return {
  font = wezterm.font(font_primary),
  font_size = 13,
  color_scheme = "tokyonight",

  -- scroll bar
  enable_scroll_bar = true,

  -- status
  status_update_interval = 1000,

  -- tab bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = false,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  -- window
  window_padding = {
    left = 5,
    right = 10,
    top = 12,
    bottom = 7,
  },
  window_close_confirmation = "NeverPrompt",
  window_frame = {
    active_titlebar_bg = "#090909",
    font = wezterm.font(font_primary, { bold = true }),
    font_size = 9,
  },
  automatically_reload_config = true,
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
  window_background_opacity = 0.95,
  
  mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  },
}

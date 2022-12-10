local wezterm = require 'wezterm'

return {
  font = wezterm.font 'Fira Code',

  default_prog = { '/opt/homebrew/bin/fish', '-l' },
  color_scheme = "OneHalfDark",
}

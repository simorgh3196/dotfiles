vim.filetype.add {
  extension = {
    applescript = "applescript",
    gs = "javascript",
    jbuilder = "ruby",
    penta = "pentadactyl",
    plist = "xml",
    pm = "perl",
    podspec = "ruby",
    ttx = "xml",
  },
  filename = {
      ["Podfile", "Appfile", "Fastfile", "Matchfile"] = "ruby"
  },
}

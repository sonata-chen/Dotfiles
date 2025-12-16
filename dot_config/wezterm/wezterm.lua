local wezterm = require("wezterm")

return {
  default_prog = { "fish" },

  -- font settings
  font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font Mono",
    "Noto Sans Mono CJK TC",
  }),
  font_size = 22.5,
  warn_about_missing_glyphs = false,

  -- behaviours
  show_tab_index_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  -- appearances
  window_padding = { left = 10, right = 10, top = 5, bottom = 5 },
  window_frame = { -- fancy tab mobe
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font({ family = "Roboto", weight = "Bold" }),

    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems
    font_size = 13,
  },

  color_scheme = 'Modus Vivendi',

  use_ime = false, -- only XIM is implemented

  keys = {
    { key = 'F7', action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = 'F8', action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = 'UpArrow', mods = 'SHIFT', action = wezterm.action.ScrollToPrompt(-1) },
    { key = 'DownArrow', mods = 'SHIFT', action = wezterm.action.ScrollToPrompt(1) },
  }
}

-- vim: ts=2

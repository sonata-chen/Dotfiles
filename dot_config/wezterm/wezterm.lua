local wezterm = require("wezterm")

local function modified_tokyo_night()
  local tokyo_colors = wezterm.get_builtin_color_schemes()['Tokyo Night']
  local tab_bar = {
    background = tokyo_colors.ansi[1],
    inactive_tab_edge = tokyo_colors.background,
    active_tab = {
      bg_color = tokyo_colors.background,
      fg_color = tokyo_colors.ansi[5],
    },
    inactive_tab = {
      bg_color = tokyo_colors.background,
      fg_color = tokyo_colors.brights[1],
    },
    inactive_tab_hover = {
      bg_color = tokyo_colors.background,
      fg_color = tokyo_colors.brights[1],
    },
    new_tab = {
      bg_color = tokyo_colors.ansi[1],
      fg_color = tokyo_colors.ansi[1],
    },
    new_tab_hover = {
      bg_color = tokyo_colors.ansi[1],
      fg_color = tokyo_colors.ansi[1],
    },
  }

  local h, l, s, _ = wezterm.color.parse(tokyo_colors['selection_bg']):hsla()
  tokyo_colors['selection_bg'] = wezterm.color.from_hsla(h, l, s, 0.4)
  tokyo_colors['selection_fg'] = 'none'
  tokyo_colors['tab_bar'] = tab_bar

  return tokyo_colors
end

local tokyo_colors = modified_tokyo_night()

return {
  default_prog = { "/usr/bin/fish" },

  -- font settings
  font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font Mono",
    "Noto Sans Mono CJK TC",
  }),
  font_size = 14.5,
  warn_about_missing_glyphs = false,

  -- behaviours
  show_tab_index_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  -- appearances
  window_padding = { left = 5, right = 5, top = 2, bottom = 2 },
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

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = tokyo_colors.ansi[1],

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = tokyo_colors.background,
  },

  colors = tokyo_colors,

  use_ime = false, -- only XIM is implemented

  keys = {
    { key = 'F7', action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = 'F8', action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  }
}

-- vim: ts=2

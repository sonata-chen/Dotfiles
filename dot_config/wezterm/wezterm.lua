local wezterm = require("wezterm")

local colors = {
  bg = "#32302f",
  fg = "#d5c4a1",
}

local colors_normal = {
  "#32302f", -- black
  "#cc241d", -- red
  "#98971a", -- green
  "#d79921", -- yellow
  "#458588", -- blue
  "#b16286", -- magenta
  "#689d6a", -- cyan
  "#a89984", -- white
}

local colors_bright = {
  "#928374", -- black
  "#fb4934", -- red
  "#b8bb26", -- green
  "#fabd2f", -- yellow
  "#83a598", -- blue
  "#d3869b", -- magenta
  "#8ec07c", -- cyan
  "#ebdbb2", -- white
}


return {
  default_prog = {"/bin/fish"},
  -- font settings
  -- font = wezterm.font("FiraCode Nerd Font Mono"),
  font = wezterm.font_with_fallback({
    -- "FiraCode Nerd Font Mono",
    "JetBrainsMono Nerd Font Mono",
    -- "Iosevka Nerd Font Mono",
    "Noto Sans Mono CJK TC",
  }),
  font_size = 14.5,
  warn_about_missing_glyphs = false,

  -- behaviours
  show_tab_index_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  -- appearances
  window_padding = { left = 5, right = 5, top = 2, bottom = 2 },
  force_reverse_video_cursor = true,
  window_frame = { -- fancy tab mobe
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font({family="Roboto", weight="Bold"}),

    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems
    font_size = 12.0,

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = "#222222",

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = "#222222",
  },
  colors = {
    foreground = colors.fg,
    -- background = colors.bg,
    background = '#282828',
    -- background = '#1D2021',
    ansi = colors_normal,
    brights = colors_bright,

    -- compose_cursor = "orange",

    tab_bar = {
      background = colors.bg,
      active_tab = {
        bg_color = '#222222',
        fg_color = colors.fg,
        intensity = "Bold",
      },
      inactive_tab = {
        bg_color = "#222222",
        fg_color = "#666666",
      },
      inactive_tab_hover = {
        bg_color = "#222222",
        fg_color = "#666666",
      },
      new_tab = {
        bg_color = "#222222",
        fg_color = "#222222",
      },
      new_tab_hover = {
        bg_color = "#222222",
        fg_color = "#222222",
      },
    },
  },

  use_ime = true, -- only XIM is implemented

  keys = {
    {key='F7', action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key='F8', action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  }
}

-- vim: ts=2

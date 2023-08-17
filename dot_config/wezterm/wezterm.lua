local wezterm = require("wezterm")


local ansi = {
  "#35363b", -- black
  "#de5d68", -- red
  "#8fb573", -- green
  "#dbb671", -- yellow
  "#57a5e5", -- blue
  "#bb70d2", -- magenta
  "#51a8b3", -- cyan
  "#7c7e82", -- white
}

local brights = {
  "#35363b", -- black
  "#f95865", -- red
  "#98ce70", -- green
  "#fac767", -- yellow
  "#73b7ee", -- blue
  "#ca87de", -- magenta
  "#5cd0de", -- cyan
  "#c7c9cd", -- white
}

local colors = {
  bg = "#232326",
  bg1 = "#2c2d31",
  bg2 = "#35363b",
  bg3 = "#37383d",
  bg_d = "#1b1c1e",
  fg = "#a7aab0",

  black = ansi[1],
  red = ansi[2],
  green = ansi[3],
  yellow = ansi[4],
  blue = ansi[5],
  magenta = ansi[6],
  cyan = ansi[7],
  white = ansi[8],

  br_black = brights[1],
  br_red = brights[2],
  br_green = brights[3],
  br_yellow = brights[4],
  br_blue = brights[5],
  br_magenta = brights[6],
  br_cyan = brights[7],
  br_white = brights[8],
}

return {
  default_prog = {"/usr/bin/fish"},
  -- font settings
  -- font = wezterm.font("FiraCode Nerd Font Mono"),
  font = wezterm.font_with_fallback({
    -- "FiraCode Nerd Font Mono",
    "JetBrainsMono Nerd Font Mono",
    -- "Iosevka Nerd Font Mono",
    "Noto Sans Mono CJK TC",
  }),
  font_size = 14.5,
  -- warn_about_missing_glyphs = false,

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
    font = wezterm.font({family="Roboto", weight="Bold"}),

    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems
    font_size = 11,

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = colors.bg_d,

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = colors["bg"],
  },

  colors = {
    scrollbar_thumb = '#222222',

    foreground = colors.fg,
    background = colors.bg,

    ansi = ansi,
    brights = brights,

    cursor_bg = colors.fg,
    cursor_fg = colors.bg,
    compose_cursor = 'orange',

    -- Make the selection text color fully transparent.
    -- When fully transparent, the current text color will be used.
    selection_fg = 'none',
    -- Set the selection background color with alpha.
    -- When selection_bg is transparent, it will be alpha blended over
    -- the current cell background color, rather than replace it
    selection_bg = 'rgba(21%, 21%, 23% 70%)',

    tab_bar = {
      --   background = colors.bg,
      inactive_tab_edge = colors.bg_d,
      active_tab = {
        bg_color = colors.bg1,
        fg_color = colors.fg,
        intensity = "Bold",
      },
      inactive_tab = {
        bg_color = colors.bg_d,
        fg_color = colors.bg3,
      },
      inactive_tab_hover = {
        bg_color = colors.bg_d,
        fg_color = colors.black,
      },
      new_tab = {
        bg_color = colors.bg_d,
        fg_color = colors.bg_d,
      },
      new_tab_hover = {
        bg_color = colors.bg_d,
        fg_color = colors.bg_d,
      },
    },
  },

  use_ime = false, -- only XIM is implemented

  keys = {
    {key='F7', action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key='F8', action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  }
}

-- vim: ts=2

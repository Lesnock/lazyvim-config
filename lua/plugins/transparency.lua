return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  config = function()
    require("transparent").clear_prefix("Neotree")
    require("transparent").setup({
      groups = { -- table: default groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        -- "CursorLine",
        -- "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
        "lualine_c_normal",
        "TabLine",
      },
      extra_groups = {
        -- "NeoTree",
      },
      exclude_groups = {
        "CursorLine",
        "CursorLineNr",
        "NeoTreeCursorLine",
      },
    })
  end,
}

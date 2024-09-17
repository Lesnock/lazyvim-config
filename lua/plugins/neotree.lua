return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    -- Remove indent lines
    opts.default_component_configs.indent.with_markers = false
    opts.default_component_configs.indent.with_expanders = true
  end,
}

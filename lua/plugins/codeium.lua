return {
  {
    "Exafunction/codeium.nvim",
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {
      enable_cmp_source = true,
      virtual_text = {
        enabled = true,
        key_bindings = {
          accept = "<Tab>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
  },
}

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--Delete "s" keymap from LazyVim
vim.keymap.del("n", "s")

vim.keymap.set("n", "<leader>th", function()
  vim.cmd([[ToggleTerm]])
end, { desc = "Open terminal" })

-- Debugging
-- stylua: ignore start
vim.keymap.set({ "n", "v" }, "<F5>", function() require("dap").continue() end, { desc = "Continue" })
vim.keymap.set({ "n", "v" }, "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set({ "n", "v" }, "<F10>", function() require("dap").step_over() end, { desc = "Step Over" })
vim.keymap.set({ "n", "v" }, "<F11>", function() require("dap").step_into() end, { desc = "Step Into" })
-- stylua: ignore end

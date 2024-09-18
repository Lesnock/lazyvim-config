-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Remove pseudo transparent from popup-menu
vim.opt.pumblend = 0

-- PHP intelephense instead of phpactor
vim.g.lazyvim_php_lsp = "intelephense"

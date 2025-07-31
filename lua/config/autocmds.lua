-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.http",
    command = "set filetype=http",
})

-- Copy to clipboard
vim.opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 then
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("Yank", { clear = true }),
        callback = function()
            vim.fn.system("clip.exe", vim.fn.getreg('"'))
        end,
    })
end

-- Automatically load last session of direction
vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
    callback = function()
        require("persistence").load()
    end,
    nested = true,
})

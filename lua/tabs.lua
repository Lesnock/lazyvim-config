OnClick = function()
  print("It was clicked")
end

local bufnr = vim.api.nvim_create_buf(false, false)
vim.api.nvim_open_win(bufnr, true, {
  split = "right",
})

vim.wo.winbar = "%#DiffDelete#%@v:lua.OnClick@Headers | %#Normal#Payload"

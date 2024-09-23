-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local WinbarTabs = require("tabs")

local winid = vim.api.nvim_open_win(0, true, {
  split = "right",
})

local function createHeadersBuffer()
  local headersBuffer = vim.api.nvim_create_buf(false, false)
  vim.api.nvim_buf_set_lines(headersBuffer, 0, 1, false, {
    '{"name": "Caio Lesnock"}',
  })
  vim.bo[headersBuffer].filetype = "json"
  vim.bo[headersBuffer].modified = false
  vim.bo[headersBuffer].modifiable = false
  return headersBuffer
end

local function createPayloadBuffer()
  local buffer = vim.api.nvim_create_buf(false, false)
  vim.api.nvim_buf_set_lines(buffer, 0, 1, false, {
    '{"name": "Pedro Henridovsky"}',
  })
  vim.bo[buffer].filetype = "json"
  vim.bo[buffer].modified = false
  vim.bo[buffer].modifiable = false
  return buffer
end

local function createTerminalBuffer()
  local buffer = vim.api.nvim_create_buf(false, false)
  vim.bo[buffer].modified = false
  vim.api.nvim_set_current_buf(buffer)
  vim.api.nvim_set_option_value("number", false, { scope = "local", win = winid })
  vim.api.nvim_set_option_value("relativenumber", false, { scope = "local", win = winid })
  vim.fn.termopen(vim.o.shell)
  return buffer
end

local headersBuffer = createHeadersBuffer()
local payloadHeaders = createPayloadBuffer()
local terminal = createTerminalBuffer()

WinbarTabs.setup({
  winid = winid,
  highlight = {
    active = "Question",
  },
  tabs = {
    { name = "Headers", closeable = true, buffer = headersBuffer },
    { name = "Payload", buffer = payloadHeaders },
    { name = "Terminal", buffer = terminal },
  },
})

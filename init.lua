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

local headersBuffer = createHeadersBuffer()
local payloadHeaders = createPayloadBuffer()

vim.api.nvim_win_set_buf(winid, headersBuffer)

local function onEnterHeaders()
  vim.api.nvim_win_set_buf(winid, headersBuffer)
end

local function onEnterPayload()
  vim.api.nvim_win_set_buf(winid, payloadHeaders)
end

vim.api.nvim_set_hl(0, "ActiveTab", { underline = true })

WinbarTabs.setup({
  winid = winid,
  withNewTabButton = true,
  highlight = {
    active = "ActiveTab",
  },
  tabs = {
    { name = "Headers", closeable = true, onEnter = onEnterHeaders },
    { name = "Payload", onEnter = onEnterPayload },
  },
})

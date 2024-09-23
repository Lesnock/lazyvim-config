---@class WinbarTabs
local WinbarTabs = {}

WinbarTabs.tabs = {}
WinbarTabs.currentTab = 1

function WinbarTabs.setup(config)
  WinbarTabs.tabs = config.tabs
  WinbarTabs.winid = config.winid or vim.api.nvim_get_current_win()

  WinbarTabs.highlight = { normal = "Normal", active = "Search" }
  if config.highlight and config.highlight.normal then
    WinbarTabs.highlight.normal = config.highlight.normal
  end
  if config.highlight and config.highlight.active then
    WinbarTabs.highlight.active = config.highlight.active
  end

  if WinbarTabs.tabs[1].buffer then
    WinbarTabs.changeBuffer(WinbarTabs.tabs[1].buffer)
  end
  WinbarTabs.setCurrentTab(1)
  WinbarTabs.render()
end

-- Render WinbarTabs
function WinbarTabs.render()
  local parts = {}
  for index, tab in ipairs(WinbarTabs.tabs) do
    table.insert(parts, WinbarTabs.renderTab(index, tab))
  end
  vim.wo[WinbarTabs.winid].winbar = table.concat(parts, "")
end

--- Render tab
function WinbarTabs.renderTab(index, tab)
  local string = ""
  string = string .. "%" .. index .. "@v:lua.OnClickWinbarTab@"
  local highlight = WinbarTabs.highlight.normal
  if WinbarTabs.currentTab == index then
    string = string .. "%#" .. WinbarTabs.highlight.active .. "# ▌ "
  else
    if index ~= 1 then
      string = string .. " | "
    else
      string = string .. "  "
    end
  end
  string = string .. "%#" .. highlight .. "#"
  string = string .. tab.name .. string.rep(" ", 10)
  string = string .. "%X"
  if tab.closeable then
    string = string .. "%" .. index .. "@v:lua.CloseWinbarTab@%X"
  end
  string = string .. "%#" .. WinbarTabs.highlight.normal .. "#"
  return string
end

--- Activate tab by index
function WinbarTabs.setCurrentTab(index)
  if WinbarTabs.currentTab == index then
    return
  end
  WinbarTabs.currentTab = index
  local tab = WinbarTabs.tabs[index]
  if tab.buffer then
    WinbarTabs.changeBuffer(tab.buffer)
  end

  if tab.onEnter then
    tab.onEnter(index)
  end
  WinbarTabs.render()
end

--- Add a tab
function WinbarTabs.addTab(tab)
  table.insert(WinbarTabs.tabs, tab)
  WinbarTabs.render()
end

--- Close a tab by index
function WinbarTabs.closeTab(index)
  table.remove(WinbarTabs.tabs, index)
  WinbarTabs.render()
end

--- Rename a tab
function WinbarTabs.renameTab(index, name)
  WinbarTabs.tabs[index].name = name
  WinbarTabs.render()
end

--- Change buffer of window
function WinbarTabs.changeBuffer(bufnr)
  vim.api.nvim_win_set_buf(WinbarTabs.winid, bufnr)
end

function OnClickWinbarTab(index)
  WinbarTabs.setCurrentTab(index)
end

function CloseWinbarTab(index)
  WinbarTabs.closeTab(index)
end

return WinbarTabs

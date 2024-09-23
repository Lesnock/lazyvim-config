---@class WinbarTabs
local WinbarTabs = {}

WinbarTabs.tabs = {}
WinbarTabs.currentTab = 1
WinbarTabs.withNewTabButton = false

function WinbarTabs.setup(config)
  WinbarTabs.tabs = config.tabs
  WinbarTabs.winid = config.winid or vim.api.nvim_get_current_win()

  -- Highlights
  WinbarTabs.highlight = { normal = "Normal", active = "Search" }
  if config.highlight and config.highlight.normal then
    WinbarTabs.highlight.normal = config.highlight.normal
  end
  if config.highlight and config.highlight.active then
    WinbarTabs.highlight.active = config.highlight.active
  end
  --

  WinbarTabs.withNewTabButton = config.withNewTabButton or false
  WinbarTabs.render()
end

function WinbarTabs.render()
  local parts = {}
  for index, tab in ipairs(WinbarTabs.tabs) do
    table.insert(parts, WinbarTabs.renderTab(index, tab))
  end
  if WinbarTabs.withNewTabButton then
    table.insert(parts, "%@v:lua.AddWinbarTab@[+]%X")
  end
  vim.wo[WinbarTabs.winid].winbar = table.concat(parts, "")
end

function WinbarTabs.renderTab(index, tab)
  local string = ""
  string = string .. "%" .. index .. "@v:lua.OnClickWinbarTab@"
  local highlight = WinbarTabs.highlight.normal
  if WinbarTabs.currentTab == index then
    string = string .. "%#" .. WinbarTabs.highlight.active .. "# ▌ "
  else
    string = string .. " | "
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

function WinbarTabs.setCurrentTab(index)
  if WinbarTabs.currentTab == index then
    return
  end
  WinbarTabs.currentTab = index
  WinbarTabs.render()
  local tab = WinbarTabs.tabs[index]
  if tab.onEnter then
    tab.onEnter(index)
  end
  WinbarTabs.render()
end

function WinbarTabs.addNewTab()
  table.insert(WinbarTabs.tabs, { name = "New Tab" })
  WinbarTabs.render()
end

function WinbarTabs.closeTab(index)
  table.remove(WinbarTabs.tabs, index)
  WinbarTabs.render()
end

function OnClickWinbarTab(index)
  WinbarTabs.setCurrentTab(index)
end

function AddWinbarTab()
  WinbarTabs.addNewTab()
end

function CloseWinbarTab(index)
  WinbarTabs.closeTab(index)
end

return WinbarTabs

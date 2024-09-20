---@class WinbarTabs
local WinbarTabs = {}

WinbarTabs.tabs = {}
WinbarTabs.currentTab = 1

function WinbarTabs.setup(config)
  WinbarTabs.tabs = config.tabs
  WinbarTabs.winid = config.winid or vim.api.nvim_get_current_win()
  WinbarTabs.highlight = { normal = "Normal", active = "Normal" }
  if config.highlight and config.highlight.normal then
    WinbarTabs.highlight.normal = config.highlight.normal
  end
  if config.highlight and config.highlight.active then
    WinbarTabs.highlight.active = config.highlight.active
  end
  WinbarTabs.render()
end

function WinbarTabs.render()
  local parts = {}
  for index, tab in ipairs(WinbarTabs.tabs) do
    table.insert(parts, WinbarTabs.renderTab(index, tab))
  end
  vim.wo[WinbarTabs.winid].winbar = table.concat(parts, " | ")
end

function WinbarTabs.renderTab(index, tab)
  local string = ""
  string = string .. "%" .. index .. "@v:lua.OnClickWinbarTab@"
  local highlight = WinbarTabs.highlight.normal
  if WinbarTabs.currentTab == index then
    highlight = WinbarTabs.highlight.active
  end
  string = string .. "%-50#" .. highlight .. "#"
  string = string .. tab.name .. "%#Normal#"
  string = string .. "%X"
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

function OnClickWinbarTab(index)
  WinbarTabs.setCurrentTab(index)
end

return WinbarTabs

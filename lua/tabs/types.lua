---@class WinbarTabs
---@field public tabs WinbarTabs.tab[]
---@field private currentTab integer
---@field private winid integer
---@field private highlight WinbarTabs.config.highlight
---@field private withNewTabButton boolean
---@field public setup fun(config: WinbarTabs.config)
---@field private render fun(active?: integer): nil
---@field private renderTab fun(index: integer, tab: WinbarTabs.tab): nil
---@field public setCurrentTab fun(index: integer): nil
---@field public addNewTab fun(): nil
---@field public closeTab fun(index): nil

---@class WinbarTabs.config
---@field winid? integer
---@field tabs WinbarTabs.tab[]
---@field highlight? WinbarTabs.config.highlight
---@field withNewTabButton? boolean

---@class WinbarTabs.tab
---@field name string
---@field closeable? boolean
---@field onEnter? fun(tabId: integer): nil

---@class WinbarTabs.config.highlight
---@field normal? string
---@field active? string

---@class WinbarTabs
---@field public tabs WinbarTabs.tab[]
---@field private currentTab integer
---@field private winid integer
---@field private highlight WinbarTabs.config.highlight
---@field public setup fun(config: WinbarTabs.config)
---@field public setCurrentTab fun(index: integer): nil
---@field public addTab fun(tab: WinbarTabs.tab): nil
---@field public closeTab fun(index): nil
---@field public renameTab fun(index: integer, name: string): nil
---@field private render fun(active?: integer): nil
---@field private renderTab fun(index: integer, tab: WinbarTabs.tab): nil
---@field private changeBuffer fun(bufnr: integer): nil

---@class WinbarTabs.config
---@field winid? integer
---@field tabs WinbarTabs.tab[]
---@field highlight? WinbarTabs.config.highlight

---@class WinbarTabs.tab
---@field name string
---@field closeable? boolean
---@field buffer? integer
---@field onEnter? fun(tabId: integer): nil

---@class WinbarTabs.config.highlight
---@field normal? string
---@field active? string

-- Main.lua
-- Krysmatic

local src = script.parent.parent
local Roact = require(src.Roact)

local Menu = require(src.UI.Menu)

local open = false

local toolbar = plugin:CreateToolbar("Asset Search")
local pluginButton = toolbar:CreateButton("Search by ID", "Search By ID", "rbxassetid://6061165944")

-- Create Widget
local widget = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,  -- Widget will be initialized in floating panel
	false,   -- Widget will be initially enabled
	true,  -- Don't override the previous enabled state
	273,    -- Default width of the floating window
	392,    -- Default height of the floating window
	150,    -- Minimum width of the floating window (optional)
	150     -- Minimum height of the floating window (optional)
)

-- Create new widget GUI
local mainWidget = plugin:CreateDockWidgetPluginGui("MainWidget", widget)

local menuObj = Roact.mount(Roact.createElement(Menu), mainWidget, "Menu")

local function onPluginButtonClicked()
	open = not open
	mainWidget.Enabled = open and true or false
end

pluginButton.Click:Connect(onPluginButtonClicked)

-- Bind X button
mainWidget:BindToClose(function()
	open = false
	mainWidget.Enabled = false
end)
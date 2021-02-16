local UIModule = require(script.Parent.UIModule)

local toolbar = plugin:CreateToolbar("Asset Search")
local pluginButton = toolbar:CreateButton("Search by ID", "Search By ID", "rbxassetid://6061165944")

local open = false

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

local mainFrame = Instance.new("Frame")
mainFrame.BorderSizePixel = 0
mainFrame.Size	 = UDim2.new(1,0,1,0)
mainFrame.BackgroundColor3 = Color3.fromRGB(52,52,52)
mainFrame.Parent = mainWidget

UIModule:SetFrame(mainFrame)
UIModule:SetGui()

local line = Instance.new("TextLabel")
line.AnchorPoint = Vector2.new(0.5,0)
line.Position = UDim2.new(0.5,0,0.19,0)
line.Size = UDim2.new(0.9,0,0.005,0)
line.BackgroundColor3 = Color3.fromRGB(171,171,171)
line.BorderSizePixel = 0
line.Text = ""
line.Parent = mainFrame

local function onPluginButtonClicked()
	if open then
		mainWidget.Enabled = false
		open = false
	else
		mainWidget.Enabled = true
		open = true
	end
end

pluginButton.Click:Connect(onPluginButtonClicked)

local UIModule = {}
local SearchModule = require(script.Parent.SearchModule)

local mainFrame
local assetId

-- Directory button colors
local onColor = Color3.fromRGB(25,122,157)
local offColor = Color3.fromRGB(84,84,84)

function UIModule:SetFrame(frame)
	mainFrame = frame
end

-- Set textlabel
function UIModule:SetTextLabel(position, size, textColor, text)
	local textLabel = Instance.new("TextLabel")
	textLabel.BackgroundTransparency = 1
	textLabel.AnchorPoint = Vector2.new(0.5,0)
	textLabel.Position = position
	textLabel.Size = size
	textLabel.TextScaled = true
	textLabel.TextColor3 = textColor
	textLabel.Font = "Cartoon"
	textLabel.Text = text
	textLabel.Parent = mainFrame
end

-- Set textbutton
function UIModule:SetTextButton(position, size, text)
	local button = Instance.new("TextButton")
	button.BackgroundColor3 = onColor
	button.AnchorPoint = Vector2.new(0.5,0)
	button.Position = position
	button.Size = size
	button.TextScaled = true
	button.TextColor3 = Color3.fromRGB(255,255,255)
	button.Font = "Cartoon"
	button.Text = text
	button.Name = text
	
	local uiCorner = Instance.new("UICorner")
	uiCorner.Parent = button
	
	if button.Text == "SEARCH" then
		button.MouseButton1Click:Connect(function()
			SearchModule:Search(mainFrame, assetId, onColor)
		end)
	else
		button.MouseButton1Click:Connect(function()
			if button.BackgroundColor3 == onColor then
				button.BackgroundColor3 = offColor
			else
				button.BackgroundColor3 = onColor
			end
		end)
	end
	
	button.Parent = mainFrame
end

function UIModule:SetGui()
	-- Title
	self:SetTextLabel(UDim2.new(0.5,0,0.031,0), UDim2.new(0.8,0,0.115,0), Color3.fromRGB(63,193,232), "AssetID Search")
	-- krysmatic
	self:SetTextLabel(UDim2.new(0.5,0,0.13,0), UDim2.new(0.3,0,0.038,0), Color3.fromRGB(255,255,255), "By Krysmatic")
	-- Information
	self:SetTextLabel(UDim2.new(0.5,0,0.219,0), UDim2.new(0.8,0,0.104,0), Color3.fromRGB(255,255,255), "Type in the asset ID you want to search for and go to View > Output to see them.")
	-- Search In
	self:SetTextLabel(UDim2.new(0.5,0,0.321,0), UDim2.new(0.4,0,0.059,0), Color3.fromRGB(255,255,255), "Search In")

	-- Search
	self:SetTextButton(UDim2.new(0.5,0,0.901,0), UDim2.new(0.366,0,0.059,0), "SEARCH")
	-- Workspace
	self:SetTextButton(UDim2.new(0.28,0,0.401,0), UDim2.new(0.4,0,0.061,0), "Workspace")
	-- Lighting
	self:SetTextButton(UDim2.new(0.28,0,0.482,0), UDim2.new(0.4,0,0.061,0), "Lighting")
	-- ReplicatedFirst
	self:SetTextButton(UDim2.new(0.716,0,0.401,0), UDim2.new(0.4,0,0.061,0), "ReplicatedFirst")
	-- ReplicatedStorage
	self:SetTextButton(UDim2.new(0.716,0,0.482,0), UDim2.new(0.4,0,0.061,0), "ReplicatedStorage")
	-- ServerStorage
	self:SetTextButton(UDim2.new(0.28,0,0.564,0), UDim2.new(0.4,0,0.061,0), "ServerStorage")
	-- StarterGui
	self:SetTextButton(UDim2.new(0.716,0,0.564,0), UDim2.new(0.4,0,0.061,0), "StarterGui")
	-- StarterPack
	self:SetTextButton(UDim2.new(0.28,0,0.646,0), UDim2.new(0.4,0,0.061,0), "StarterPack")
	-- SoundService
	self:SetTextButton(UDim2.new(0.716,0,0.646,0), UDim2.new(0.4,0,0.061,0), "SoundService")
	
	-- Asset ID textbox
	assetId = Instance.new("TextBox")
	assetId.BackgroundColor3 = Color3.fromRGB(179,179,179)
	assetId.AnchorPoint = Vector2.new(0.5,0)
	assetId.Position = UDim2.new(0.5,0,0.765,0)
	assetId.Size = UDim2.new(0.8,0,0.099,0)
	assetId.TextScaled = true
	assetId.TextColor3 = Color3.fromRGB(103,103,103)
	assetId.Text = "Enter Asset ID"
	assetId.Font = "SourceSans"
	
	local assetIDCorner = Instance.new("UICorner")
	assetIDCorner.Parent = assetId
	
	assetId.Parent = mainFrame
end

return UIModule

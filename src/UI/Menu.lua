-- Krysmatic

local src = script.parent.parent
local Roact = require(src.Roact)

local Menu = Roact.Component:extend("Menu")

local input

local SearchModule = require(script.Parent.Parent.Core.SearchModule)

local BLUE_COLOR = Color3.fromRGB(25,122,157)
local OFF_COLOR = Color3.fromRGB(84,84,84)

local TEXT_PROPS = {
    Title = {
        Position = UDim2.new(0.5,0,0.031,0),
        Size = UDim2.new(0.8,0,0.115,0),
        Color = BLUE_COLOR,
        ZIndex = 100,
        Text = "AssetID Search"
    },
    Credit = {
        Position = UDim2.new(0.5,0,0.13,0),
        Size = UDim2.new(0.3,0,0.038,0),
        Color = Color3.fromRGB(255,255,255),
        ZIndex = 100,
        Text = "By Krysmatic"
    },
    Information = {
        Position = UDim2.new(0.5,0,0.219,0),
        Size = UDim2.new(0.8,0,0.104,0),
        Color = Color3.fromRGB(255,255,255),
        ZIndex = 100,
        Text = "Type in the asset ID you want to search for and go to View > Output to see them."
    },
    SearchIn = {
        Position = UDim2.new(0.5,0,0.321,0),
        Size = UDim2.new(0.4,0,0.059,0),
        Color = Color3.fromRGB(255,255,255),
        ZIndex = 100,
        Text = "Search In"
    }
}

-- General text labels
local function CreateText(props)
    return Roact.createElement("TextLabel", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5,0),
        Position = props.Position,
        Size = props.Size,
        TextScaled = true,
        TextColor3 = props.Color,
        Font = "Cartoon",
        Text = props.Text
    })
end

function Menu:init()
    self:setState({
        settings = {
            Workspace = {
                Activated = true,
                Position = UDim2.new(0.28,0,0.401,0)
            },
            Lighting = {
                Activated = true,
                Position = UDim2.new(0.28,0,0.482,0)
            },
            ReplicatedFirst = {
                Activated = true,
                Position = UDim2.new(0.716,0,0.401,0)
            },
            ReplicatedStorage = {
                Activated = true,
                Position = UDim2.new(0.716,0,0.482,0)
            },
            ServerStorage = {
                Activated = true,
                Position = UDim2.new(0.28,0,0.564,0)
            },
            StarterGui = {
                Activated = true,
                Position = UDim2.new(0.716,0,0.564,0)
            },
            StarterPack = {
                Activated = true,
                Position = UDim2.new(0.28,0,0.646,0)
            },
            SoundService = {
                Activated = true,
                Position = UDim2.new(0.716,0,0.646,0)
            }
        }
    })
end

function Menu:render()
    local settings = self.state.settings
    local gui = {}

    -- Create settings buttons
    for service, props in pairs(settings) do
        gui[service] = Roact.createElement("TextButton", {
            Text = service,
            BackgroundColor3 = props.Activated and BLUE_COLOR or OFF_COLOR,
            TextColor3 = Color3.fromRGB(255,255,255),
            TextScaled = true,
            Font = "Cartoon",
            Size = UDim2.new(0.4,0,0.061,0),
            Position = props.Position,
            AnchorPoint = Vector2.new(0.5,0),
            [Roact.Event.MouseButton1Click] = function(rbx)
                settings[rbx.Text]["Activated"] = not settings[rbx.Text]["Activated"]
                self:setState(function()
                    return {
                        settings
                    }
                end)
            end
        }, {
            UICorner = Roact.createElement("UICorner", {})
        })
    end

    -- Create text
    for text, props in pairs(TEXT_PROPS) do
        gui[text] = Roact.createElement(CreateText, {
            Position = props["Position"],
            Size = props["Size"],
            Color = props["Color"],
            Text = props["Text"]
        })
    end

    -- Create line
    gui["Line"] = Roact.createElement("TextLabel", {
        BackgroundColor3 = Color3.fromRGB(171,171,171),
        Position = UDim2.fromScale(0.5,0.19),
        AnchorPoint = Vector2.new(0.5,0),
        Size = UDim2.fromScale(0.9,0.005),
        Text = "",
        BorderSizePixel = 0
    })

    -- Create TextBox
    gui["EnterID"] = Roact.createElement("TextBox", {
        BackgroundColor3 = Color3.fromRGB(179,179,179),
        Position = UDim2.new(0.5,0,0.765,0),
        AnchorPoint = Vector2.new(0.5,0),
        Size = UDim2.new(0.8,0,0.099,0),
        TextScaled = true,
        TextColor3 = Color3.fromRGB(103,103,103),
        Text = "Enter Asset ID",
        Font = "SourceSans",
        Name = "SearchID",
        [Roact.Change.Text] = function(rbx)
            input = rbx.Text
        end
    }, {
        UICorner = Roact.createElement("UICorner",{})
    })

    gui["Search"] = Roact.createElement("TextButton", {
        Text = "SEARCH",
        BackgroundColor3 = BLUE_COLOR,
        TextColor3 = Color3.fromRGB(255,255,255),
        TextScaled = true,
        Font = "Cartoon",
        Size = UDim2.new(0.4,0,0.059,0),
        Position = UDim2.new(0.5,0,0.901,0),
        AnchorPoint = Vector2.new(0.5,0),
        [Roact.Event.MouseButton1Click] = function(_)
            SearchModule:Search(settings, input)
        end
    }, {
        UICorner = Roact.createElement("UICorner",{})
    })

    return Roact.createElement("Frame", {
        Size = UDim2.fromScale(1,1),
        BackgroundColor3 = Color3.fromRGB(52,52,52)
    }, gui)
end

return Menu
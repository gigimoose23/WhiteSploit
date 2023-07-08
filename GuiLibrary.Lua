-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local TEMPLATES = Instance.new("Folder")
local WINDOW = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local items = Instance.new("ScrollingFrame")
local UICorner_2 = Instance.new("UICorner")
local button = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local uistroke = Instance.new("UIStroke")
local mainfolder = Instance.new("Folder")

-- Gui to Lua
-- Version: 3.2

-- Instances:

local togglewindow = Instance.new("ImageButton")

--Properties:






ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TEMPLATES.Name = "TEMPLATES"
TEMPLATES.Parent = ScreenGui

WINDOW.Name = "WINDOW"
WINDOW.Parent = TEMPLATES
WINDOW.BackgroundColor3 = Color3.fromRGB(56, 202, 255)
WINDOW.BorderColor3 = Color3.fromRGB(0, 0, 0)
WINDOW.BorderSizePixel = 0
WINDOW.Position = UDim2.new(0.145867124, 0, 0.0995333865, 0)
WINDOW.Size = UDim2.new(0, 171, 0, 358)
WINDOW.Visible = false

TextLabel.Parent = WINDOW
TextLabel.BackgroundColor3 = Color3.fromRGB(56, 202, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0799999982, 0, 0.0251396652, 0)
TextLabel.Size = UDim2.new(0, 114, 0, 27)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "window_name"
TextLabel.TextColor3 = Color3.fromRGB(51, 130, 158)
TextLabel.TextScaled = true
TextLabel.TextSize = 48.000
TextLabel.TextWrapped = true
TextLabel.Name = "WINDOWNAME"
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

UICorner.Parent = TextLabel

UITextSizeConstraint.Parent = TextLabel
UITextSizeConstraint.MaxTextSize = 15

items.Name = "items"
items.Parent = WINDOW
items.Active = true
items.BackgroundColor3 = Color3.fromRGB(56, 202, 255)
items.BorderColor3 = Color3.fromRGB(0, 0, 0)
items.BorderSizePixel = 0
items.Position = UDim2.new(0.0760233924, 0, 0.100558661, 0)
items.Size = UDim2.new(0, 145, 0, 300)
items.ScrollBarThickness = 6

UICorner_2.Parent = items

button.Name = "button"
button.Parent = TEMPLATES
button.BackgroundColor3 = Color3.fromRGB(49, 179, 222)
button.BorderColor3 = Color3.fromRGB(0, 0, 0)
button.BorderSizePixel = 0
button.Position = UDim2.new(0.15172413, 0, 0.0206102263, 0)
button.Size = UDim2.new(0, 100, 0, 39)
button.Font = Enum.Font.GothamBold
button.Text = "NAME"
button.TextColor3 = Color3.fromRGB(45, 116, 140)
button.TextSize = 14.000
button.Visible = false

UICorner_3.Parent = button

UICorner_4.Parent = WINDOW

UIAspectRatioConstraint.Parent = ScreenGui
UIAspectRatioConstraint.AspectRatio = 1.919

uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uistroke.Color = Color3.new(0.247059, 0.435294, 0.505882)
uistroke.Thickness = 2.7
uistroke.Transparency = 0
uistroke.LineJoinMode = Enum.LineJoinMode.Round
uistroke.Parent = button

mainfolder.Name = "MAIN"
mainfolder.Parent = ScreenGui
togglewindow.Parent = WINDOW
togglewindow.Name = "ToggleWindow"
togglewindow.BackgroundColor3 = Color3.fromRGB(51, 130, 158)
togglewindow.BackgroundTransparency = 1.000
togglewindow.BorderColor3 = Color3.fromRGB(0, 0, 0)
togglewindow.BorderSizePixel = 0
togglewindow.Position = UDim2.new(0.78, 0,0.03, 0)
togglewindow.Size = UDim2.new(0, 22, 0, 19)
togglewindow.Image = "rbxassetid://13999746265"


--Properties:
function CreateWindow(windowname)
	local clonedwindow = WINDOW:Clone()
	
	clonedwindow.WINDOWNAME.Text = tostring(windowname)
	clonedwindow.Name = tostring(windowname)
	clonedwindow.Visible = true
	clonedwindow.Parent = mainfolder
	
	

	

	

	
	local UIS = game:GetService('UserInputService')
	local frame = clonedwindow
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	local bigwindow = true
	clonedwindow.ToggleWindow.MouseButton1Click:Connect(function()
		
		
		if bigwindow == false then
			bigwindow = true
			clonedwindow.items.Visible = true
			clonedwindow.Size = UDim2.new(0, 171,0, 358)
			clonedwindow.ToggleWindow.Image = "rbxassetid://13999746265"
		else
			bigwindow = false
			clonedwindow.items.Visible = false
			clonedwindow.Size = UDim2.new(0, 171,0, 30)
			clonedwindow.ToggleWindow.Image = "rbxassetid://13999753168"
		end
		
	end)
end
function AddButton(windowname, buttonname)
	
	
	
	local clonedbutton = button:Clone()
	
	
	
	
	clonedbutton.Text = tostring(buttonname)
	clonedbutton.Name = tostring(buttonname)
	clonedbutton.Visible = true
	clonedbutton.Parent = mainfolder:FindFirstChild(tostring(windowname)).items
	
	if not mainfolder:FindFirstChild(tostring(windowname)):FindFirstChild("OldY") then
		oldy = Instance.new("NumberValue")
		oldy.Parent = mainfolder:FindFirstChild(tostring(windowname))
		oldy.Name = "OldY"
		oldy.Value = 0.021
	end
	
	clonedbutton.Position = UDim2.new(0.048, 0, oldy.Value, 0)
	oldy.Value = oldy.Value + 0.09
	
	
end
function OnButtonPress(windowname, buttonname, callback)
	mainfolder:FindFirstChild(tostring(windowname)).items:WaitForChild(tostring(buttonname)).MouseButton1Click:Connect(callback)
end
function RemoveWindow(windowname)
	mainfolder:FindFirstChild(tostring(windowname)):Destroy()
end
function RemoveButton(windowname, buttonname)
	mainfolder:FindFirstChild(tostring(windowname)).items:WaitForChild(tostring(buttonname)):Destroy()
end
local userInputService = game:GetService("UserInputService")
enabled = false
local blur = Instance.new("BlurEffect")
blur.Parent = game.Lighting

blur.Size = 12
blur.Enabled = false
ScreenGui.Enabled = false
userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end
	if userInputService:IsKeyDown(Enum.KeyCode.H) then
		
		if enabled == true then
			blur.Enabled = false
			ScreenGui.Enabled = false
			enabled = false
		else
			blur.Enabled = true
			ScreenGui.Enabled = true
			enabled = true
		end
		
	end
end)


CreateWindow("hello")
AddButton("hello", "buttondjwe")

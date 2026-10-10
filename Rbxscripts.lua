--!! TRANSPARENT OVERLAY LOCALSCRIPT (DELTA MOBILE COMPATIBLE) !!--
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 1. Create a transparent screen layout overlay
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BrazilMobileOverlay"
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 9999999
ScreenGui.Parent = PlayerGui

-- 2. Build David Baszucki directly on your screen without a black background
local DavidImage = Instance.new("ImageLabel")
DavidImage.Size = UDim2.new(0.5, 0, 0.7, 0) -- Scaled to fit nicely on phone screens
DavidImage.Position = UDim2.new(0.25, 0, 0.25, 0) -- Centered on screen
DavidImage.Image = "http://roblox.com" -- Universal mobile asset ID
DavidImage.BackgroundTransparency = 1 -- Makes the background square completely invisible
DavidImage.ScaleType = Enum.ScaleType.Fit
DavidImage.Parent = ScreenGui

-- 3. Create a clean, readable speech bubble layered right above his head
local SpeechBubble = Instance.new("TextLabel")
SpeechBubble.Size = UDim2.new(0.4, 0, 0.12, 0)
SpeechBubble.Position = UDim2.new(0.3, 0, 0.12, 0) -- Placed neatly over David's head
SpeechBubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeechBubble.Text = "YOU'RE GOING TO BRAZIL..."
SpeechBubble.TextColor3 = Color3.fromRGB(255, 0, 0)
SpeechBubble.TextScaled = true
SpeechBubble.Font = Enum.Font.SourceSansBold
SpeechBubble.Parent = ScreenGui

-- Round the speech bubble edges
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = SpeechBubble

-- 4. Dialogue display timer (4 seconds)
task.wait(4) 

-- Remove the speech bubble to mark that he is done talking
SpeechBubble:Destroy()

-- 5. Silent 10-second countdown while David stands there staring at you
task.wait(10)

-- 6. High-velocity fling mechanics
local Character = LocalPlayer.Character
if Character then
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    
    if RootPart and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        RootPart.CanCollide = false
        
        -- Apply massive forces to fling the character out of the map boundaries
        local AngularVelocity = Instance.new("BodyAngularVelocity")
        AngularVelocity.AngularVelocity = Vector3.new(0, 500000, 0)
        AngularVelocity.MaxTorque = Vector3.new(0, 500000, 0)
        AngularVelocity.Parent = RootPart
        
        local LinearVelocity = Instance.new("BodyVelocity")
        LinearVelocity.Velocity = Vector3.new(2500, 8000, 2500)
        LinearVelocity.MaxForce = Vector3.new(1e7, 1e7, 1e7)
        LinearVelocity.Parent = RootPart
    end
end

-- 7. Disconnect player with the custom alert screen
task.wait(0.8)
LocalPlayer:Kick("\n\ncheck your account and location immediately ⚠️")

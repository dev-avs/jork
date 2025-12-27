local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildWhichIsA("Humanoid")
local backpack = player:FindFirstChildWhichIsA("Backpack")

if not humanoid or not backpack then return end

-- Function to check if character is R15
local function isR15(char)
    return char:FindFirstChild("UpperTorso") ~= nil
end

local tool = Instance.new("Tool")
tool.Name = "Jerk Off"
tool.ToolTip = "in the stripped club. straight up \"jorking it\" . and by \"it\" , haha, well. let's justr say. My peanits."
tool.RequiresHandle = false
tool.Parent = backpack

local jorkin = false
local track = nil

local function stopTomfoolery()
    jorkin = false
    if track then
        track:Stop()
        track = nil
    end
end

tool.Equipped:Connect(function() 
    jorkin = true 
end)

tool.Unequipped:Connect(stopTomfoolery)
humanoid.Died:Connect(stopTomfoolery)

task.spawn(function()
    while task.wait() do
        if not jorkin then continue end

        local r15 = isR15(character)
        if not track then
            local anim = Instance.new("Animation")
            anim.AnimationId = not r15 and "rbxassetid://72042024" or "rbxassetid://698251653"
            track = humanoid:LoadAnimation(anim)
        end

        track:Play()
        track:AdjustSpeed(r15 and 0.7 or 0.65)
        track.TimePosition = 0.6
        task.wait(0.1)
        while track and track.TimePosition < (not r15 and 0.65 or 0.7) do 
            task.wait(0.1) 
        end
        if track then
            track:Stop()
            track = nil
        end
    end
end)

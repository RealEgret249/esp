-- Server Script to highlight all players in the game
local Players = game:GetService("Players")

-- Function to add a highlight effect to a player's character
local function highlightPlayer(player)
    -- Check if player has a character
    if player.Character then
        -- Check if a highlight already exists
        if not player.Character:FindFirstChild("Highlight") then
            -- Create a new highlight object
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(255, 255, 0)  -- Yellow highlight color
            highlight.OutlineColor = Color3.fromRGB(0, 0, 0)   -- Black outline color
            highlight.FillTransparency = 0.5                    -- Semi-transparent fill
            highlight.OutlineTransparency = 0                   -- Solid outline
        end
    end
end

-- Function to highlight all players' characters
local function highlightAllPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        highlightPlayer(player)
    end
end

-- Connect to players being added and their character being added
local function onPlayerAdded(player)
    -- Highlight the player's character if it already exists
    highlightPlayer(player)

    -- Highlight the character whenever it respawns
    player.CharacterAdded:Connect(function()
        highlightPlayer(player)
    end)
end

-- Connect to all current players
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Connect to new players joining
Players.PlayerAdded:Connect(onPlayerAdded)

-- Server Script to continuously highlight all players in the game
local Players = game:GetService("Players")

-- Function to add a highlight effect to a player's character
local function highlightPlayer(player)
    -- Check if player has a character
    if player.Character then
        -- Check if a highlight already exists
        local existingHighlight = player.Character:FindFirstChild("Highlight")
        if not existingHighlight then
            -- Create a new highlight object if it doesn't exist
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(255, 255, 0)  -- Yellow highlight color
            highlight.OutlineColor = Color3.fromRGB(0, 0, 0)   -- Black outline color
            highlight.FillTransparency = 0.5                    -- Semi-transparent fill
            highlight.OutlineTransparency = 0                   -- Solid outline
        end
    end
end

-- Loop to update highlights every second
while true do
    -- Iterate through all players and apply the highlight
    for _, player in ipairs(Players:GetPlayers()) do
        highlightPlayer(player)
    end
    -- Wait for 1 second before updating again
    wait(1)
end

-- LocalScript (colocar em StarterGui ou StarterPlayerScripts)
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Aguarda o character carregar pela primeira vez
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Cria GUI simples
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnchorGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Name = "AnchorButton"
button.Parent = screenGui
button.Size = UDim2.new(0, 120, 0, 40)
button.Position = UDim2.new(0.5, -60, 0.9, -20)
button.Text = "Anchor"
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundTransparency = 0.3
button.BorderSizePixel = 0

-- Arredonda os cantos do botão
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = button

-- Estado
local anchored = false
local originalWalkSpeed = nil
local originalJumpPower = nil

local function getHumanoid()
    if player.Character then
        return player.Character:FindFirstChildOfClass("Humanoid")
    end
    return nil
end

local function freezeCharacter()
    local hum = getHumanoid()
    if not hum then 
        warn("Humanoid não encontrado!")
        return 
    end
    
    -- Salva valores originais apenas uma vez
    if not originalWalkSpeed then
        originalWalkSpeed = hum.WalkSpeed
    end
    if not originalJumpPower then
        originalJumpPower = hum.JumpPower
    end
    
    -- Congela o personagem
    hum.WalkSpeed = 0
    hum.JumpPower = 0
    hum.PlatformStand = true
    
    anchored = true
    button.Text = "Unanchor"
    button.BackgroundColor3 = Color3.fromRGB(200, 50, 50) -- Vermelho quando ancorado
    
    print("Personagem ancorado!")
end

local function unfreezeCharacter()
    local hum = getHumanoid()
    if not hum then 
        warn("Humanoid não encontrado!")
        return 
    end
    
    -- Restaura valores originais
    if originalWalkSpeed then 
        hum.WalkSpeed = originalWalkSpeed 
    end
    if originalJumpPower then 
        hum.JumpPower = originalJumpPower 
    end
    hum.PlatformStand = false
    
    anchored = false
    button.Text = "Anchor"
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Cor normal
    
    print("Personagem desancorado!")
end

-- Conecta o botão
button.MouseButton1Click:Connect(function()
    if anchored then
        unfreezeCharacter()
    else
        freezeCharacter()
    end
end)

-- Quando o personagem reaparecer
player.CharacterAdded:Connect(function(char)
    task.wait(0.5) -- Aguarda o character carregar completamente
    
    if anchored then
        -- Reaplicar o freeze no novo character
        task.wait(0.1)
        freezeCharacter()
    else
        -- Garantir que os valores estejam corretos
        local hum = char:WaitForChild("Humanoid")
        if hum and originalWalkSpeed then
            hum.WalkSpeed = originalWalkSpeed
            hum.JumpPower = originalJumpPower
            hum.PlatformStand = false
        end
    end
end)

print("Script de Anchor carregado com sucesso!")

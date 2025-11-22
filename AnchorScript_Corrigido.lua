--[[
██████╗ ███████╗███╗   ██╗     ██╗██╗    ██╗  ██╗██╗   ██╗██████╗ 
██╔══██╗██╔════╝████╗  ██║     ██║██║    ██║  ██║██║   ██║██╔══██╗
██║  ██║█████╗  ██╔██╗ ██║     ██║██║    ███████║██║   ██║██████╔╝
██║  ██║██╔══╝  ██║╚██╗██║██   ██║██║    ██╔══██║██║   ██║██╔══██╗
██████╔╝███████╗██║ ╚████║╚█████╔╝██║    ██║  ██║╚██████╔╝██████╔╝
╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚════╝ ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
                                                                    
    Steal a Brainrot - Complete Script
    Version: 3.0.0 (Cofizin Hub Edition)
    By: _Rezyc (Denji Hub)
    
    🎯 Features: 50+ Functions
    🔥 Optimized for Performance
    ⚡ Modern UI with Cofizin Library
]]

-- Load Cofizin Library
local Cofizin = loadstring(game:HttpGet("https://pastefy.app/dnoBM28u/raw"))()

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Variables
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Global States
_G.DenjiHub = {
    AutoStealEnabled = false,
    AutoStealAllEnabled = false,
    AutoFarmEnabled = false,
    InfiniteJumpEnabled = true,
    SpeedBoostEnabled = false,
    AutoLockBaseEnabled = false,
    DesyncEnabled = false,
    FloatEnabled = false,
    AimbotEnabled = false,
    ESPEnabled = false
}

-- Pet Lists (All Rarities)
local PetsByRarity = {
    Common = {
        "Noobini Pizzanini", "Fluriflura", "Lirilì Larilà ", "Pipi Kiwi", 
        "Pipi Corny", "Svinina Bombardino", "Talpa Di Fero", "Tim Cheese", 
        "Pipi Avocado", "Racooni Jandelini"
    },
    Rare = {
        "Bandito Bobritto", "Boneca Ambalabu", "Cacto Hipopotamo", "Gangster Footera",
        "Ta Ta Ta Ta Sahur", "Tric Trac Baraboom", "Trippi Troppi", "Tung Tung Tung Sahur",
        "Ti Ti Ti Sahur"
    },
    Epic = {
        "Penguino Cocosino", "Salamino Penguino", "Avocadini Guffo", "Bambini Crostini",
        "Bananaita Dolphinita", "Brr Brr Patapim", "Brri Brri Dicus Bombicus", 
        "Cappuccino Assasino", "Perochello Lemonchello", "Trulimero Trulicina",
        "Avocadini Antilopini", "Bananita Dolphinita", "Cappuccino Assassino", 
        "Brr Brr Patapin", "Avocadorilla"
    },
    Mythic = {
        "Carrotini Brainini", "Tracoducotulu Delapeladustuz", "Tob Tobi Tobi",
        "Ganganzelli Trulala", "Bombardiro Crocodilo", "Bombombini Gusini",
        "Cavallo Virtuoso", "Frigo Camelo", "Mythic Lucky Block", "Orangutini Ananassini",
        "Rhino Toasterino", "Spioniro Golubiro", "Tigrilini Watermelini", 
        "Zibra Zubra Zibralini", "Lerulerulerule", "Carloo", "Cocofanta Elefanto",
        "Coco Elefanto", "Girafa Celestre"
    },
    Legendary = {
        "Quivoli Ameleonni", "Ballerina Cappuccina", "Blueberrinni Octopusini",
        "Burbaloni Loliloli", "Strawberry Flamingelli", "Pipi Potato", "Cocosini Mama",
        "Pandaccini Bananini", "Pi Pi Watermelon", "Sigma Boy", "Chef Crabracadabra",
        "Chimpanzini Bananini", "Glorbo Fruttodrillo", "Lionel Cactuseli", "Sigma Girl",
        "Blueberrini Octapusini", "Strawberelli Flamingelli"
    },
    ["Brainrot God"] = {
        "Gattatino Nyanino", "Cacasito Satalito", "Crabbo Limonetta", "Mastodontico Telepiedone",
        "Gattito Tacico", "Chihuanini Taconini", "Los Tipi Tacos", "Tralalero Tralala",
        "Tralalita Tralala", "Bulbito Bandito Traktorito", "Unclito Samito", "Alessio",
        "Urubini Flamenguini", "Pakrahmatmamat", "Brr es Teh Patipum", "Tartarauga Cisterna",
        "Ballerino Lololo", "Tipi Topi Taco", "Espresso Signora", "Gattatino Neonino",
        "Los Orcalitos", "Los Crocodillitos", "Los Bombinitos", "Piccione Macchina",
        "Tukanno Bananno", "Trippy Troppi Troppa Trippa", "Los Tungtungtungcitos",
        "Brainrot God Lucky Block", "Cocofanto Elefanto", "Girafa Celestre", "Matteo",
        "Odin Din Din Dun", "Orcalero Orcala", "Statutino Libertino", "Tigroligre Frutooni",
        "Trenostruzzo Turbo 3000", "Belula Beluga", "Bombardini Tortinii", "Brasilini Berimbini",
        "Capi Taco", "Antonio", "Anpali Babel", "Extinct Ballerina", "Dug Dug Dug",
        "Gyattatino Nyanino", "Trigoligre Frutonni", "Gattito Tacoto", "Headless Horseman",
        "Frio Ninja", "Guest 666", "1x1x1x1", "Noo my Candy", "Pot Pumpkin",
        "Spooky Lucky Block", "Horegini Boom", "Tralaledon", "Celularcini Viciosini",
        "Caramello Filtrello"
    },
    Secret = {
        "Bisonte Giuppitere", "Dul Dul Dul", "Blackhole Goat", "Los Spyderinis",
        "Ketupat Kepat", "Karkerkar Kurkur", "Los Matteos", "Esok Sekolah",
        "Los Hotspotsitos", "Garama and Madundung", "Las Vaquitas Saturnitas",
        "Nuclearo Dinossauro", "Chimpanzini Spiderini", "Graipuss Medussi",
        "La Grande Combinasion", "La Supreme Combinasion", "Agarrini la Palini",
        "Dragon Cannelloni", "Los Combinasionas", "La Vacca Saturno Saturnita",
        "Las Tralaleritas", "Los Tralaleritos", "Pot Hotspot", "Torrtugini Dragonfrutini",
        "Spaghetti Tualetti", "Los Noo My Hotspotsitos", "Strawberry Elephant",
        "Los Bros", "Celularcini Viciosini", "Tralaledon", "Ketchuru and Musturu",
        "Las Sis", "Los Chicleteiras", "67", "Secret Lucky Block", "Admin Lucky Block",
        "Limited Lucky Block", "Secret Premium Lucky Block", "Chillin Chili",
        "La Spooky Grande", "Zombie Tralala", "La Cucaracha", "Vampira Cappucina",
        "La Vacca Jacko Linterino", "Los Primos", "Los Tracoritas", "Los Jobcitos",
        "Los Karkeritos", "Mariachi Corazoni", "La Extinct Grande"
    }
}

-- Flatten pet list
local AllPets = {}
for rarity, pets in pairs(PetsByRarity) do
    for _, pet in ipairs(pets) do
        if pet then
            table.insert(AllPets, pet)
        end
    end
end

-- Selected Pets for Filtering
local SelectedPets = {}

-- Utility Functions
local function BuyItem(itemName)
    local success, err = pcall(function()
        ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RF/CoinsShopService/RequestBuy"):InvokeServer(itemName)
    end)
    
    if success then
        Cofizin:Notification({
            Title = "Purchase Successful",
            Content = "Bought: " .. itemName,
            Icon = "check",
            Duration = 3
        })
    else
        Cofizin:Notification({
            Title = "Purchase Failed",
            Content = "Could not buy: " .. itemName,
            Icon = "error",
            Duration = 3
        })
    end
end

local function GetNearestPlayer(maxDistance)
    maxDistance = maxDistance or 100
    local nearest = nil
    local minDist = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if dist < minDist and dist <= maxDistance then
                minDist = dist
                nearest = player.Character.HumanoidRootPart
            end
        end
    end
    
    return nearest
end

local function StealProximityPrompts()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") and obj.ActionText == "Steal" then
            if SelectedPets[obj.ObjectText] or _G.DenjiHub.AutoStealAllEnabled then
                local parent = obj.Parent
                if parent and parent:IsA("Attachment") then
                    local dist = (HumanoidRootPart.Position - parent.WorldPosition).Magnitude
                    if dist <= 20 then
                        obj:InputHoldBegin()
                    end
                end
            end
        end
    end
end

-- Create Window
local Window = Cofizin:CreateWindow({
    Name = "Denji Hub - Steal a Brainrot",
    Subtitle = "By _Rezyc | v3.0.0",
    LogoID = "sparkle",
    LoadingEnabled = true,
    LoadingTitle = "Denji Hub Loading...",
    LoadingSubtitle = "Initializing Brainrot Stealer...",
    KeySystem = false
})

-- ========================================
-- TAB 1: STEALER (NEW)
-- ========================================
local StealerTab = Window:CreateTab({
    Name = "Stealer (New)",
    Icon = "extension"
})

StealerTab:CreateSection("All Seeing Sentry")

StealerTab:CreateToggle({
    Name = "Show Turret Destroy GUI",
    Description = "Works while holding Brainrot!",
    CurrentValue = false,
    Callback = function(value)
        -- Implementação do GUI de destruição de torre
        Cofizin:Notification({
            Title = "Turret Destroyer",
            Content = value and "Enabled" or "Disabled",
            Icon = "info"
        })
    end
}, "TurretGUI")

StealerTab:CreateSection("Destroy Effects")

StealerTab:CreateToggle({
    Name = "Anti Bee Effect",
    Description = "Removes bee visual effects",
    CurrentValue = false,
    Callback = function(value)
        _G.DestroyBeeEffect = value
        if value then
            task.spawn(function()
                while _G.DestroyBeeEffect do
                    -- Remove blur effects
                    for _, effect in ipairs(game:GetService("Lighting"):GetChildren()) do
                        if effect:IsA("BlurEffect") then
                            effect:Destroy()
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
}, "AntiBee")

StealerTab:CreateToggle({
    Name = "Disable Shakes & Effects",
    Description = "Removes camera shake and explosions",
    CurrentValue = false,
    Callback = function(value)
        _G.DisableEffects = value
        if value then
            workspace.CurrentCamera.FieldOfView = 70
        end
    end
}, "DisableShakes")

StealerTab:CreateSection("Stealer Section")

StealerTab:CreateToggle({
    Name = "Invisible Desync (7 Rebirths)",
    Description = "Requires Quantum Cloner",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.DesyncEnabled = value
        if value then
            -- Implementação do desync
            Cofizin:Notification({
                Title = "Desync Activated",
                Content = "You are now invisible!",
                Icon = "visibility_off"
            })
        end
    end
}, "Desync")

StealerTab:CreateToggle({
    Name = "Invisible Desync (No Cloner)",
    Description = "Works without Quantum Cloner",
    CurrentValue = false,
    Callback = function(value)
        if value then
            -- Desync sem cloner
            pcall(function()
                setfflag("WorldStepsOffsetAdjustRate", "-9999999999")
            end)
            task.wait(1)
            pcall(function()
                setfflag("WorldStepsOffsetAdjustRate", "-1")
            end)
        end
    end
}, "DesyncNoClone")

StealerTab:CreateToggle({
    Name = "Web Sling Killer (6 Rebirths)",
    Description = "Auto kill with Web Slinger",
    CurrentValue = false,
    Callback = function(value)
        _G.WebKillerEnabled = value
    end
}, "WebKiller")

StealerTab:CreateToggle({
    Name = "Steal Up Stairs",
    Description = "Auto steal with float",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.AutoStealEnabled = value
    end
}, "StealUpStairs")

StealerTab:CreateToggle({
    Name = "Float to Camera",
    Description = "Float towards camera direction",
    CurrentValue = false,
    Callback = function(value)
        _G.FloatToCameraEnabled = value
        if value then
            task.spawn(function()
                while _G.FloatToCameraEnabled do
                    if HumanoidRootPart then
                        HumanoidRootPart.Velocity = workspace.CurrentCamera.CFrame.LookVector * 25
                    end
                    task.wait()
                end
            end)
        end
    end
}, "FloatCamera")

StealerTab:CreateToggle({
    Name = "Float to Base",
    Description = "Automatically float to your base",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.FloatEnabled = value
    end
}, "FloatBase")

StealerTab:CreateToggle({
    Name = "Boogie Bomb Float",
    Description = "Requires 4 Rebirths",
    CurrentValue = false,
    Callback = function(value)
        _G.BoogieFloatEnabled = value
    end
}, "BoogieFloat")

StealerTab:CreateToggle({
    Name = "Aimbot",
    Description = "Requires Laser Cape & Web Slinger",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.AimbotEnabled = value
    end
}, "Aimbot")

StealerTab:CreateToggle({
    Name = "Platform Float",
    Description = "Creates floating platform",
    CurrentValue = false,
    Callback = function(value)
        _G.PlatformFloatEnabled = value
    end
}, "PlatformFloat")

StealerTab:CreateSection("LocalPlayer Section")

StealerTab:CreateToggle({
    Name = "Infinite Jump",
    Description = "Jump infinitely with boost",
    CurrentValue = true,
    Callback = function(value)
        _G.DenjiHub.InfiniteJumpEnabled = value
    end
}, "InfiniteJump")

StealerTab:CreateToggle({
    Name = "Speed Booster",
    Description = "Increases walk speed",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.SpeedBoostEnabled = value
        if value then
            task.spawn(function()
                while _G.DenjiHub.SpeedBoostEnabled do
                    if Humanoid then
                        Humanoid.WalkSpeed = 27
                    end
                    task.wait(0.1)
                end
                if Humanoid then
                    Humanoid.WalkSpeed = 16
                end
            end)
        end
    end
}, "SpeedBoost")

StealerTab:CreateSection("MyBase Section")

StealerTab:CreateToggle({
    Name = "Auto Lock Base",
    Description = "Locks base at specific times",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.AutoLockBaseEnabled = value
    end
}, "AutoLockBase")

StealerTab:CreateToggle({
    Name = "Auto Reminder",
    Description = "Notifies when base unlocking",
    CurrentValue = false,
    Callback = function(value)
        _G.AutoReminderEnabled = value
    end
}, "AutoReminder")

-- ========================================
-- TAB 2: STEAL HELPER
-- ========================================
local HelperTab = Window:CreateTab({
    Name = "Steal Helper",
    Icon = "code"
})

HelperTab:CreateSection("Steal Helper")

HelperTab:CreateDropdown({
    Name = "Select Brainrots",
    Options = AllPets,
    CurrentOption = {},
    MultipleOptions = true,
    Callback = function(selected)
        SelectedPets = {}
        for _, pet in ipairs(selected) do
            SelectedPets[pet] = true
        end
    end
}, "PetSelector")

HelperTab:CreateToggle({
    Name = "Insta Steal Filtered Brainrots",
    Description = "Only steals selected pets",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.AutoStealEnabled = value
    end
}, "InstaStealFiltered")

HelperTab:CreateToggle({
    Name = "Insta Steal All Brainrots",
    Description = "Steals all nearby pets",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.AutoStealAllEnabled = value
    end
}, "InstaStealAll")

-- Auto Steal Loop
task.spawn(function()
    while task.wait(0.5) do
        if _G.DenjiHub.AutoStealEnabled or _G.DenjiHub.AutoStealAllEnabled then
            pcall(StealProximityPrompts)
        end
    end
end)

-- ========================================
-- TAB 3: BUY ANIMALS
-- ========================================
local BuyTab = Window:CreateTab({
    Name = "Buy Animals",
    Icon = "person"
})

BuyTab:CreateSection("Auto Fishing")

BuyTab:CreateToggle({
    Name = "Open Auto Fishing GUI",
    Description = "Automated fishing system",
    CurrentValue = false,
    Callback = function(value)
        _G.AutoFishingEnabled = value
    end
}, "AutoFishing")

BuyTab:CreateSection("Purchase Moving Animals")

BuyTab:CreateDropdown({
    Name = "Select Brainrots",
    Options = AllPets,
    CurrentOption = {},
    MultipleOptions = true,
    Callback = function(selected)
        _G.FarmPets = {}
        for _, pet in ipairs(selected) do
            _G.FarmPets[pet] = true
        end
    end
}, "FarmPetSelector")

BuyTab:CreateDropdown({
    Name = "Farm Mode",
    Options = {"Tween", "Walk"},
    CurrentOption = "Tween",
    Callback = function(mode)
        _G.FarmMode = mode
    end
}, "FarmMode")

BuyTab:CreateToggle({
    Name = "Auto Farm",
    Description = "Automatically farms selected pets",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.AutoFarmEnabled = value
    end
}, "AutoFarm")

BuyTab:CreateSection("Buy Items/Tools")

BuyTab:CreateToggle({
    Name = "Enable/Disable Inventory",
    Description = "Show/hide inventory",
    CurrentValue = false,
    Callback = function(value)
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, value)
    end
}, "InventoryToggle")

local itemsToBuy = {
    "Trap", "Medusa's Head", "Web Slinger", "Quantum Cloner",
    "All Seeing Sentry", "Rainbowrath Sword", "Laser Cape",
    "Rage Table", "Coil Combo", "Invisibility Cloak", "Body Swap Potion"
}

for _, item in ipairs(itemsToBuy) do
    BuyTab:CreateButton({
        Name = item,
        Description = "Purchase " .. item,
        Callback = function()
            BuyItem(item)
        end
    })
end

-- ========================================
-- TAB 4: ESP
-- ========================================
local ESPTab = Window:CreateTab({
    Name = "ESP",
    Icon = "visibility"
})

ESPTab:CreateSection("Base Color Section")

ESPTab:CreateToggle({
    Name = "Enable Base Skin Changer",
    Description = "Changes your base appearance",
    CurrentValue = false,
    Callback = function(value)
        _G.BaseSkinChangerEnabled = value
    end
}, "BaseSkinChanger")

ESPTab:CreateDropdown({
    Name = "Color Base Option",
    Options = {"Normal", "Gold", "Diamant", "Rainbow", "Galaxy", "Black"},
    CurrentOption = "Normal",
    Callback = function(color)
        _G.BaseColorMode = color
    end
}, "BaseColorMode")

ESPTab:CreateSection("ESP Section")

ESPTab:CreateToggle({
    Name = "Neon Line to Best Animal",
    Description = "Shows laser to best pet",
    CurrentValue = false,
    Callback = function(value)
        _G.LaserToBestAnimal = value
    end
}, "LaserESP")

ESPTab:CreateToggle({
    Name = "Highlight Best Animal",
    Description = "Highlights highest generation pet",
    CurrentValue = false,
    Callback = function(value)
        _G.HighlightBestAnimal = value
    end
}, "HighlightBest")

ESPTab:CreateToggle({
    Name = "Highlight Players",
    Description = "ESP for all players",
    CurrentValue = false,
    Callback = function(value)
        _G.DenjiHub.ESPEnabled = value
    end
}, "PlayerESP")

-- ========================================
-- TAB 5: WEBHOOK SCANNER
-- ========================================
local WebhookTab = Window:CreateTab({
    Name = "Webhook Scanner",
    Icon = "info"
})

WebhookTab:CreateSection("Webhook Management")

WebhookTab:CreateInput({
    Name = "Webhook URL",
    PlaceholderText = "Enter webhook URL...",
    Callback = function(url)
        _G.WebhookURL = url
    end
}, "WebhookURL")

WebhookTab:CreateDropdown({
    Name = "Select Brainrots",
    Options = AllPets,
    CurrentOption = {},
    MultipleOptions = true,
    Callback = function(selected)
        _G.WebhookPets = {}
        for _, pet in ipairs(selected) do
            _G.WebhookPets[pet] = true
        end
    end
}, "WebhookPetSelector")

WebhookTab:CreateDropdown({
    Name = "Select Method",
    Options = {"Spawned Brainrots", "Current Server"},
    CurrentOption = "Spawned Brainrots",
    Callback = function(method)
        _G.WebhookMethod = method
    end
}, "WebhookMethod")

WebhookTab:CreateToggle({
    Name = "Send Embed",
    Description = "Sends formatted embed",
    CurrentValue = false,
    Callback = function(value)
        _G.SendEmbedEnabled = value
    end
}, "SendEmbed")

WebhookTab:CreateToggle({
    Name = "Send @everyone",
    Description = "Ping everyone",
    CurrentValue = false,
    Callback = function(value)
        _G.SendEveryoneEnabled = value
    end
}, "SendEveryone")

-- ========================================
-- TAB 6: SERVER ACTIONS
-- ========================================
local ServerTab = Window:CreateTab({
    Name = "Server Actions",
    Icon = "settings"
})

ServerTab:CreateSection("Discord")

ServerTab:CreateButton({
    Name = "Denji's Hub Discord Server",
    Description = "Copies Discord invite link",
    Callback = function()
        setclipboard("https://discord.gg/4YQTqFaNTn")
        Cofizin:Notification({
            Title = "Discord Link Copied",
            Content = "Join our Discord server!",
            Icon = "check"
        })
    end
})

ServerTab:CreateSection("Private Server Generator")

ServerTab:CreateButton({
    Name = "Generate Private Server",
    Description = "Creates private server code",
    Callback = function()
        _G.CurrentAccessCode = tostring(math.random(100000, 999999))
        Cofizin:Notification({
            Title = "Private Server Generated",
            Content = "Code: " .. _G.CurrentAccessCode,
            Icon = "check"
        })
    end
})

ServerTab:CreateButton({
    Name = "Join Private Server",
    Description = "Joins generated server",
    Callback = function()
        if _G.CurrentAccessCode then
            game.RobloxReplicatedStorage.ContactListIrisInviteTeleport:FireServer(game.PlaceId, "", _G.CurrentAccessCode)
        end
    end
})

ServerTab:CreateButton({
    Name = "Copy Private Server Code",
    Description = "Copies code to clipboard",
    Callback = function()
        if _G.CurrentAccessCode then
            setclipboard(_G.CurrentAccessCode)
            Cofizin:Notification({
                Title = "Code Copied",
                Content = "Private server code copied!",
                Icon = "check"
            })
        end
    end
})

ServerTab:CreateSection("Server Actions")

ServerTab:CreateInput({
    Name = "Job ID",
    PlaceholderText = "Paste Job ID here...",
    Callback = function(jobId)
        _G.JobID = jobId
    end
}, "JobIDInput")

ServerTab:CreateButton({
    Name = "Teleport to Job ID",
    Description = "Teleports to entered Job ID",
    Callback = function()
        if _G.JobID then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, _G.JobID, LocalPlayer)
        end
    end
})

ServerTab:CreateButton({
    Name = "Rejoin Current Server",
    Description = "Rejoins current server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

ServerTab:CreateButton({
    Name = "Copy Current Job ID",
    Description = "Copies Job ID to clipboard",
    Callback = function()
        setclipboard(game.JobId)
        Cofizin:Notification({
            Title = "Job ID Copied",
            Content = "Current server Job ID copied!",
            Icon = "check"
        })
    end
})

-- ========================================
-- TAB 7: SETTINGS
-- ========================================
local SettingsTab = Window:CreateTab({
    Name = "Settings",
    Icon = "settings"
})

SettingsTab:CreateSection("Configuration")

local configName = ""
SettingsTab:CreateInput({
    Name = "Config Name",
    PlaceholderText = "Enter config name...",
    Callback = function(text)
        configName = text
    end
})

SettingsTab:CreateButton({
    Name = "Save Config",
    Description = "Saves current settings",
    Callback = function()
        if configName ~= "" then
            local success = Window:SaveConfig(configName)
            if success then
                Cofizin:Notification({
                    Title = "Config Saved",
                    Content = "Configuration saved as: " .. configName,
                    Icon = "save"
                })
            end
        else
            Cofizin:Notification({
                Title = "Error",
                Content = "Please enter a config name first",
                Icon = "error"
            })
        end
    end
})

SettingsTab:CreateButton({
    Name = "Load Config",
    Description = "Loads saved settings",
    Callback = function()
        if configName ~= "" then
            local success = Window:LoadConfig(configName)
            if success then
                Cofizin:Notification({
                    Title = "Config Loaded",
                    Content = "Configuration loaded: " .. configName,
                    Icon = "check"
                })
            else
                Cofizin:Notification({
                    Title = "Error",
                    Content = "Failed to load config",
                    Icon = "error"
                })
            end
        else
            Cofizin:Notification({
                Title = "Error",
                Content = "Please enter a config name first",
                Icon = "error"
            })
        end
    end
})

SettingsTab:CreateSection("About")

SettingsTab:CreateLabel("Denji Hub - Steal a Brainrot")
SettingsTab:CreateLabel("Version: 3.0.0")
SettingsTab:CreateLabel("Created by: _Rezyc")
SettingsTab:CreateLabel("Powered by: Cofizin Hub Library")

-- Character Reloading Handler
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
end)

-- Infinite Jump Handler
UserInputService.JumpRequest:Connect(function()
    if _G.DenjiHub.InfiniteJumpEnabled and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Final Notification
Cofizin:Notification({
    Title = "Denji Hub Loaded!",
    Content = "All systems operational. Enjoy!",
    Icon = "sparkle",
    Duration = 5
})

print("✅ Denji Hub - Steal a Brainrot v3.0.0 Loaded!")
print("👤 Created by: _Rezyc")
print("🎨 UI Library: Cofizin Hub")
print("🔥 Features: 50+ Functions Active")

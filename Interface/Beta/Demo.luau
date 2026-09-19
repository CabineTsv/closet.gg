local closet = loadstring(game:HttpGet("https://raw.githubusercontent.com/CabineTsv/closet.gg/refs/heads/main/Interface/Beta/Interface.luau"))()

local Window = closet:CreateWindow({
    Title = "closet.gg",
    Theme = "Midnight",
    LoadingEnabled = false,
    LoadingTitle = "closet.gg",
    LoadingMode = "duration",
    LoadingDuration = 2,
    NotificationPosition = "Down-Right",
    NotificationSound = true,
    NotificationSFX = "Soft Ping",
    Language = "English"
})

local CombatTab = Window:create_tab("Combat", "sword")
local VisualsTab = Window:create_tab("Visuals", "eye")
local MiscTab = Window:create_tab("Misc", "settings")

local AimbotModule = CombatTab:create_module({
    title = "Aimbot", -- string, title of the module
    description = "lock on players automaticall", -- string, explains what the module does
    flag = "AimbotModuleEnabled", -- string, unique flag to tell configs what should be on/off, never repeat the same flag
    section = "left", -- string, tells the UI where the module should be
    callback = function(state)
      print(state)
    end
})

AimbotModule:create_checkbox({ -- check box is basically a toggle
    title = "Enable Aimbot",
    flag = "AimbotEnabled",
    callback = function(state)
      print("Aimbot is ", state)
    end
})

AimbotModule:create_slider({
    title = "FOV Radius",
    flag = "AimbotFOV",
    minimum_value = 10, -- number, lowest value the slider can go to
    maximum_value = 200, -- number, highest value the slider can go to
    value = 90, -- number, default value the slider will be on 
    round_number = true, -- boolean, tells the slider if it should allow decimals, false will allow, true will not
    callback = function(value)
      print(value)
    end
})

AimbotModule:create_dropdown({
    title = "Target Priority",
    flag = "AimbotPriority",
    options = {"Closest", "Lowest Health", "Highest Health"}, -- table, options to pick from the dropdown
    multi_dropdown = false, -- boolean, allows for multiple options, but the separate element is better
    maximum_options = 3, -- number, maximum number of options the dropdown can show
    callback = function(selected)
      print(selected)
    end
})

AimbotModule:create_keybind({
    title = "Aimbot Keybind",
    flag = "AimbotKeybind",
    default = Enum.KeyCode.E, -- default keybind
    mode = "Hold", -- string, choose between toggle or hold, toggle toggles a feature on or off when the key is pressed, hold does something while being held
    callback = function(key)
      print("being held")
    end
})

local TriggerbotModule = CombatTab:create_module({
    title = "Triggerbot",
    description = "Automatically fires when your crosshair is on a target",
    flag = "TriggerbotModuleEnabled",
    section = "right",
    callback = function(state)
    end
})

TriggerbotModule:create_checkbox({
    title = "Enable Triggerbot",
    flag = "TriggerbotEnabled",
    callback = function(state)
    end
})

TriggerbotModule:create_slider({
    title = "Delay (ms)",
    flag = "TriggerbotDelay",
    minimum_value = 0,
    maximum_value = 500,
    value = 50,
    round_number = true,
    callback = function(value)
    end
})

local TriggerbotStatus = TriggerbotModule:create_status({
    title = "Status",
    flag = "TriggerbotStatus",
    status = "Disabled"
})

local ESPModule = VisualsTab:create_module({
    title = "ESP",
    description = "Reveal information about other players through walls",
    flag = "ESPModuleEnabled",
    section = "left",
    callback = function(state)
    end
})

ESPModule:create_multidropdown({
    title = "ESP Features",
    flag = "ESPFeatures",
    options = {"Boxes", "Names", "Health Bars", "Distance", "Tracers"},
    default = {"Boxes", "Names"},
    callback = function(selected)
    end
})

ESPModule:create_colorpicker({
    title = "Box Color",
    flag = "ESPBoxColor",
    default = Color3.fromRGB(130, 100, 255), -- color, default color the color picker is
    callback = function(color)
    end
})

ESPModule:create_progressbar({
    title = "Render Distance",
    flag = "ESPRenderDistance",
    value = 75,
    callback = function(value)
    end
})

local ChamsModule = VisualsTab:create_module({
    title = "Chams",
    description = "Highlight players through walls with a solid fill",
    flag = "ChamsModuleEnabled",
    section = "right",
    callback = function(state)
    end
})

ChamsModule:create_checkbox({
    title = "Enable Chams",
    flag = "ChamsEnabled",
    callback = function(state)
    end
})

ChamsModule:create_colorpicker({
    title = "Fill Color",
    flag = "ChamsFillColor",
    default = Color3.fromRGB(60, 140, 255),
    callback = function(color)
    end
})

ChamsModule:create_buttongroup({
    title = "Chams Mode",
    buttons = {
        {text = "Flat", callback = function() end},
        {text = "Outline", callback = function() end},
        {text = "Both", callback = function() end}
    }
})

MiscTab:create_label({
    title = "closet.gg v1.0.0"
})

local UtilityModule = MiscTab:create_module({
    title = "Utility",
    description = "Miscellaneous quality of life features",
    flag = "UtilityModuleEnabled",
    section = "left",
    callback = function(state)
    end
})

UtilityModule:create_textbox({
    title = "Custom Tag",
    flag = "UtilityCustomTag",
    placeholder = "Enter tag text",
    callback = function(text)
    end
})

UtilityModule:create_paragraph({
    title = "About",
    text = "closet.gg is a modular UI library built for Roblox game customization scripts."
})

UtilityModule:create_divider({
    title = "Danger Zone",
    showtopic = true
})

UtilityModule:create_button({
    title = "Reset Configuration",
    buttonText = "Reset",
    description = "Restore all settings back to their defaults",
    callback = function()
        closet:SendNotification({
            title = "Configuration",
            text = "All settings have been reset to their defaults",
            type = "warning",
            duration = 4
        })
    end
})

local ConfigModule = MiscTab:create_module({
    title = "Configuration",
    description = "Manage window behavior and keybinds",
    flag = "ConfigModuleEnabled",
    section = "right",
    callback = function(state)
    end
})

ConfigModule:create_keybind({
    title = "Toggle UI",
    flag = "UIToggleKeybind",
    default = Enum.KeyCode.RightControl,
    mode = "Toggle",
    callback = function(key)
    end
})

ConfigModule:create_keybinddisplay({
    title = "Active Binds",
    binds = {"AimbotKeybind", "UIToggleKeybind"}
})

ConfigModule:create_image({
    title = "Logo",
    image = "rbxassetid://0",
    size = UDim2.new(1, 0, 0, 80),
    cornerRadius = 8
})

MiscTab:create_button({
    title = "Documentation",
    buttonText = "Open",
    description = "View the full closet.gg documentation",
    callback = function()
    end
})

closet:SendNotification({
    title = "Welcome",
    text = "closet.gg has loaded successfully",
    type = "success",
    duration = 5
})

task.wait(2)

closet:SendNotification({
    title = "Heads Up",
    text = "Remember to configure your keybinds before you start",
    type = "info",
    duration = 5
})

local Watermark = closet:CreateWatermark({
    title = "closet.gg",
    fps = true,
    ping = true
})

Watermark:SetLine("player", "Player: "..game.Players.LocalPlayer.Name)

local StatsDisplay = closet:CreateStatsDisplay({
    title = "Session Stats"
})

StatsDisplay:SetLine("kills", "Kills: 0")
StatsDisplay:SetLine("targets", "Targets Tracked: 0")

task.wait(3)

closet:ShowDialog({
    title = "Enable Aimbot?",
    text = "This will turn on automatic target tracking for this session.",
    confirm_text = "Enable",
    cancel_text = "Cancel",
    callback = function(result)
        if result then
            TriggerbotStatus:SetStatus("Enabled", "Active")
            closet:SendNotification({
                title = "Aimbot",
                text = "Aimbot has been enabled",
                type = "success",
                duration = 4
            })
        else
            closet:SendNotification({
                title = "Aimbot",
                text = "Aimbot was left disabled",
                type = "default",
                duration = 4
            })
        end
    end
})

task.wait(5)

Window:apply_theme("Sapphire")

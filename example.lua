
for _,v in pairs(getconnections(game:GetService("ScriptContext").Error)) do
    v:Disable()
end

for _,v in pairs(getconnections(game:GetService("LogService").MessageOut)) do
    v:Disable()
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/refs/heads/main/Source.lua"))()
getgenv().scripttitle = "awakenkn-like-femboys"
getgenv().FolderName = "Femboyawakenkn"
loadstring(game:HttpGet('https://raw.githubusercontent.com/Awakenchan/jan/main/JanModifiedSource'))()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Awakenchan/WhitelistSystem/main/Notification"))()
local Notif = Library:InitNotifications()
Library.title = "Loading"
local Warning = library:AddWarning({type = "confirm"});
getgenv().AutoPush = false;
getgenv().getmoney = false;
-- [Legit Tab UI] ------------------------------------------------------------------------------------------------------------------------------------------------------------
local LegitTab = library:AddTab("Main"); 
local LegitColunm1 = LegitTab:AddColumn();
local LegitMain = LegitColunm1:AddSection("boys make the best girls")
LegitMain:AddToggle{
    default = false,
    text = "Get-Money", 
    flag = "moneyflag",
    callback = function(value)
        getgenv().getmoney = value
        while getgenv().getmoney do task.wait()
          game:GetService("ReplicatedStorage").RerollEvents.RandomMoney:FireServer()
        end
    end
}
LegitMain:AddToggle{
    default = false,
    text = "Auto-PushUps", 
    flag = "moneyflag",
    callback = function(value)
        getgenv().AutoPush = value
        while getgenv().AutoPush do task.wait()
            local button = game:GetService("Players").LocalPlayer.PlayerGui.PushupsGui.Pushups.Button
            local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
            if button then
                for i,v in pairs(events) do
                    for i,v in pairs(getconnections(button[v])) do
                      v:Fire()
                    end
                end
            else
                Library:Notify("[awakenkn]: cant push up without going in push up mode", 10, "success")
                return
            end
        end
    end
}
LegitMain:AddButton({text = "Reroll Pot", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. 'Are you sure you wana reroll your Pot?' .. "</font>";
    if Warning:Show() then
        game:GetService("ReplicatedStorage").RerollEvents.PotReroll:FireServer()
    end
end});
LegitMain:AddButton({text = "Reroll Clan", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. 'Are you sure you wana reroll your Clan?' .. "</font>";
    if Warning:Show() then
        game:GetService("ReplicatedStorage").RerollEvents.ClanReroll:FireServer()
    end
end});
LegitMain:AddButton({text = "Reroll Hatsu", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. 'Are you sure you wana reroll your Hatsu?' .. "</font>";
    if Warning:Show() then
        game:GetService("ReplicatedStorage").RerollEvents.HatsuReroll:FireServer()
    end
end});

-- [Library Settings UI] -----------------------------------------------------------------------------------------------------------------------------------------------------
local SettingsTab = library:AddTab("Settings"); 
local SettingsColumn = SettingsTab:AddColumn(); 
local SettingsColumn2 = SettingsTab:AddColumn(); 
local SettingSection = SettingsColumn:AddSection("Menu"); 
local ConfigSection = SettingsColumn2:AddSection("Configs");
local Warning = library:AddWarning({type = "confirm"});

SettingSection:AddBind({text = "Open / Close", flag = "UI Toggle", nomouse = true, key = "End", callback = function()
    library:Close();
end});
SettingSection:AddButton({text = "Unload UI", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. 'Are you sure you wana unload the UI?' .. "</font>";
    if Warning:Show() then
     library:Unload()
    end
end});
SettingSection:AddColor({text = "Accent Color", flag = "Menu Accent Color", color = Color3.fromRGB(88,133,198), callback = function(color)
    if library.currentTab then
        library.currentTab.button.TextColor3 = color;
    end
    for i,v in pairs(library.theme) do
        v[(v.ClassName == "TextLabel" and "TextColor3") or (v.ClassName == "ImageLabel" and "ImageColor3") or "BackgroundColor3"] = color;
    end
end});

-- [Background List]
local backgroundlist = {
    Floral = "rbxassetid://5553946656",
    Flowers = "rbxassetid://6071575925",
    Circles = "rbxassetid://6071579801",
    Hearts = "rbxassetid://6073763717"
};

-- [Background List]
local back = SettingSection:AddList({text = "Background", max = 4, flag = "background", values = {"Floral", "Flowers", "Circles", "Hearts"}, value = "Floral", callback = function(v)
    if library.main then
        library.main.Image = backgroundlist[v];
    end
end});

-- [Background Color Picker]
back:AddColor({flag = "backgroundcolor", color = Color3.new(), callback = function(color)
    if library.main then
        library.main.ImageColor3 = Color or Color3.fromRGB(37,38,38)
    end
end, trans = 1, calltrans = function(trans)
    if library.main then
        library.main.ImageTransparency = 1 - trans;
    end
end});

-- [Tile Size Slider]
SettingSection:AddSlider({text = "Tile Size", min = 50, max = 500, value = 50, callback = function(size)
    if library.main then
        library.main.TileSize = UDim2.new(0, size, 0, size);
    end
end});

-- [Discord Button]
SettingSection:AddButton({text = "Discord", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "<font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. 'Discord invite copied to clip board!' .. "</font>";
    if Warning:Show() then
     setclipboard('discord.gg/awakenkn-gg')
    end
end});

-- [Config Box]
ConfigSection:AddBox({text = "Config Name", skipflag = true});

-- [Config List]
ConfigSection:AddList({text = "Configs", skipflag = true, value = "", flag = "Config List", values = library:GetConfigs()});

-- [Create Button]
ConfigSection:AddButton({text = "Create", callback = function()
    library:GetConfigs();
    writefile(library.foldername .. "/" .. library.flags["Config Name"] .. library.fileext, "{}");
    library.options["Config List"]:AddValue(library.flags["Config Name"]);
end});

-- [Save Button]
ConfigSection:AddButton({text = "Save", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "Are you sure you want to save the current settings to config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
    if Warning:Show() then
        library:SaveConfig(library.flags["Config List"]);
    end
end});

-- [Load Button]
ConfigSection:AddButton({text = "Load", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "Are you sure you want to load config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
    if Warning:Show() then
        library:LoadConfig(library.flags["Config List"]);
    end
end});

-- [Delete Button]
ConfigSection:AddButton({text = "Delete", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "Are you sure you want to delete then config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
    if Warning:Show() then
        local config = library.flags["Config List"];
        if table.find(library:GetConfigs(), config) and isfile(library.foldername .. "/" .. config .. library.fileext) then
            library.options["Config List"]:RemoveValue(config);
            delfile(library.foldername .. "/" .. config .. library.fileext);
        end
    end
end});

-- [Init] --------------------------------------------------------------------------------------------------------------------------------------------------------------------
library:Init();
library:selectTab(library.tabs[1]);

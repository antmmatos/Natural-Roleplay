Config = {}

Config.Channels = {
    -- Example for Jobs
    [1] = {label = "PSP", jobs = {"police"}}
}

Config.Locale = "en"

-- If true, a radio list will be displayed on the players screen when they are in a radio channel
Config.ShowPlayerList = true

-- pma-voice or mumble-voip
Config.VoiceScript = "pma-voice"

-- item -> Opens through the Config.Item itemname
-- command -> Opens through the command /radio
-- keybind -> Opens through a button press (Config.Button)
-- custom -> Opens through the event "zerio-radio:client:open" or via the export "Open" (exports["zerio-radio"]:Open())
Config.OpenType = "item"

-- If true, then anonymous mode will be disabled
Config.DisableAnonymous = false

Config.Item = "radio"
-- Full keybind list exists here, https://docs.fivem.net/docs/game-references/controls/ 
-- (Only important if Config.OpenType is keybind)
Config.Button = 318

-- ONLY FOR MUMBLE-VOIP, has to be the same as the talking key for the animation to work
Config.RadioKey = 137

-- The command name for changing radio channels, if you remove this line then the command will be removed
Config.ChangeRadioChannelCommand = "changeradio"

Config.DisconnectOnDeath = true

-- IMPORTANT!! For the stopping of the radio when dropped to work this event has to be triggered when the radio gets removed from your inventory.
-- zerio-radio:client:removedradio (client event, no arguments needed)
-- Open a ticket for more information if needed

-- DONT CHANGE THIS IF YOU DONT KNOW WHAT YOU ARE DOING!!!!!!!!!!!!!!!!
Config.EventNames = {
    PlayerLoaded = "esx:playerLoaded",
    PlayerUnLoaded = "esx:onPlayerLogout"
}

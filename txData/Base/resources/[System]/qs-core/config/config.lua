QSConfig = {}
QSConfig.Player = {}
QSConfig.Notify = {}

--  _____                           _ 
-- / ____|                         | |
--| |  __  ___ _ __   ___ _ __ __ _| |
--| | |_ |/ _ \ '_ \ / _ \ '__/ _` | |
--| |__| |  __/ | | |  __/ | | (_| | |
-- \_____|\___|_| |_|\___|_|  \__,_|_|

QSConfig.Debug = false -- Debug mode, only for development.
                                   
-- Remember to modify these values ​​in qs-inventory as well
QSConfig.Player.MaxWeight = 250000 -- Total weight that the player can carry
QSConfig.Player.MaxInvSlots = 41 -- Maximum slots in inventory

--Notification system and its configuration
QSConfig.Notify.NotificationStyling = {
    group = false, -- Allow notifications to stack with a badge instead of repeating
    position = "right", -- top-left | top-right | bottom-left | bottom-right | top | bottom | left | right | center
    progress = true -- Display Progress Bar
}


--  _   _         _    _   __  _              _    _                                   _                   
-- | \ | |  ___  | |_ (_) / _|(_)  ___  __ _ | |_ (_)  ___   _ __     ___  _   _  ___ | |_  ___  _ __ ___  
-- |  \| | / _ \ | __|| || |_ | | / __|/ _` || __|| | / _ \ | '_ \   / __|| | | |/ __|| __|/ _ \| '_ ` _ \ 
-- | |\  || (_) || |_ | ||  _|| || (__| (_| || |_ | || (_) || | | |  \__ \| |_| |\__ \| |_|  __/| | | | | |
-- |_| \_| \___/  \__||_||_|  |_| \___|\__,_| \__||_| \___/ |_| |_|  |___/ \__, ||___/ \__|\___||_| |_| |_|
--                                                                         |___/                           

-- These are how you define different notification variants
-- The "icon" key is the css-icon code, this project uses `Material Icons` & `Font Awesome`
QSConfig.Notify.VariantDefinitions = {
    success = {
        classes = 'success',
        icon = 'done'
    },
    primary = {
        classes = 'primary',
        icon = 'info'
    },
    error = {
        classes = 'error',
        icon = 'dangerous'
    },
    police = {
        classes = 'police',
        icon = 'local_police'
    },
    ambulance = {
        classes = 'ambulance',
        icon = 'fas fa-ambulance'
    }
}

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
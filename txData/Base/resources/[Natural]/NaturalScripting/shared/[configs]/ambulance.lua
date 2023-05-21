AmbulanceConfig                           = {}

AmbulanceConfig.DrawDistance              = 10.0  -- How close do you need to be in order for the markers to be drawn (in GTA units).
AmbulanceConfig.Debug                     = ESX.GetConfig().EnableDebug
AmbulanceConfig.Marker                    = { type = 27, x = 0.5, y = 0.5, z = 0.5, r = 255, g = 255, b = 255, a = 180,
	rotate = false }

AmbulanceConfig.ReviveReward              = 700   -- Revive reward, set to 0 if you don't want it enabled
AmbulanceConfig.SaveDeathStatus           = true  -- Save Death Status?

AmbulanceConfig.Locale                    = GetConvar('esx:locale', 'en')

AmbulanceConfig.DistressBlip              = {
	Sprite = 310,
	Color = 48,
	Scale = 2.0
}

AmbulanceConfig.EarlyRespawnTimer         = 60000 * 7   -- time til respawn is available
AmbulanceConfig.BleedoutTimer             = 60000 * 10  -- time til the player bleeds out

AmbulanceConfig.RemoveWeaponsAfterRPDeath = true
AmbulanceConfig.RemoveCashAfterRPDeath    = true
AmbulanceConfig.RemoveItemsAfterRPDeath   = true

AmbulanceConfig.OxInventory               = ESX.GetConfig().OxInventory
AmbulanceConfig.RespawnPoints             = {
	{ coords = vector3(300.1047, -580.4274, 43.2609), heading = 82.4115 }, -- Central Los Santos
}

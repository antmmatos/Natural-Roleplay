Config = {}
Config.Locale = GetConvar('esx:locale', 'en')

Config.Accounts = {
	bank = {
		label = TranslateCap('account_bank'),
		round = true
	},
	black_money = {
		label = TranslateCap('account_black_money'),
		round = true
	},
	money = {
		label = TranslateCap('account_money'),
		round = true
	}
}

Config.StartingAccountMoney 	= {bank = 50000}

Config.DefaultSpawn 			= {x = -269.4, y = -955.3, z = 31.2, heading = 205.8}

Config.MaxWeight            	= 250   -- the max inventory weight without backpack
Config.PaycheckInterval         = 15 * 60000 -- how often to recieve pay checks in milliseconds

Config.RemoveHudCommonents = {
	[1] = false, --WANTED_STARS,
	[2] = false, --WEAPON_ICON
	[3] = false, --CASH
	[4] = false,  --MP_CASH
	[5] = false, --MP_MESSAGE
	[6] = false, --VEHICLE_NAME
	[7] = false,-- AREA_NAME
	[8] = false,-- VEHICLE_CLASS
	[9] = false, --STREET_NAME
	[10] = false, --HELP_TEXT
	[11] = false, --FLOATING_HELP_TEXT_1
	[12] = false, --FLOATING_HELP_TEXT_2
	[13] = false, --CASH_CHANGE
	[14] = false, --RETICLE
	[15] = false, --SUBTITLE_TEXT
	[16] = false, --RADIO_STATIONS
	[17] = false, --SAVING_GAME,
	[18] = false, --GAME_STREAM
	[19] = false, --WEAPON_WHEEL
	[20] = false, --WEAPON_WHEEL_STATS
	[21] = false, --HUD_COMPONENTS
	[22] = false, --HUD_WEAPONS
}

Config.CustomAIPlates = ' AA11AA '
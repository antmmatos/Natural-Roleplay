Config                               = {}

Config.Debug                         = false

Config.PayForOrder                   = true  -- true = pay for the vehicle when you order it | false = don't pay and only receive the profit when selling

Config.SetVisibility                 = true  -- true = player will be invisible when chosing a vehicle

Config.SetInvincibility              = true  -- true = player will not die while test driving

Config.CheckForOfflineOrdersEvery    = 0.5   -- In minutes | it'll check every x minutes for offline players with orders accepted, if someone is offline it'll cancel the order

Config.ShowVehicleShopBlip           = true  -- Activate/Deactivate Vehicle shop blips

Config.ShowOwnerBlip                 = true  -- Activate/Deactivate owner blips

Config.ShowBuyVehicleShopBlip        = true  -- Activate/Deactivate buy shop blip

Config.ShowHasOwnerShopBlip          = true  -- Activate/Deactivate blip of shops with "hasOwner = false"

Config.TestDrive                     = true  -- Activate/Deactivate test drive

Config.DevMode                       = false -- Allows you to restart the script (IMPORTANT: only set this to true if you are configuring the script)

Config.EventPrefix                   =
"okokVehicleShop"                            -- this will change the prefix of the events name so if Config.EventPrefix = "example" the events will be "example:event"

Config.ESXPrefix                     = "esx" -- this will change the prefix of esx events such as esx:onPlayerDeath

Config.onPlayerDeath                 = "onPlayerDeath"

Config.playerLoaded                  = "playerLoaded"

Config.getSharedObject               = "getSharedObject"

Config.TestDrivePlate                = "NATURAL"

Config.SalesDateFormat               = "%d/%m - %H:%M"

Config.UseOkokTextUI                 = true      -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.Key                           = 38        -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.UseokokRequests               = true      -- true = use okokRequests for hiring people | false = don't use okokRequests - https://okok.tebex.io/package/4724985

Config.UseSameImageForVehicles       = false     -- true = use the same image for all vehicles (vehicle.png) | false = use different images for each vehicle (vehicle_id.png)

Config.HideMinimap                   = true      -- If true it'll hide the minimap when the vehicle shop menu is opened

Config.TimeBetweenTransition         = 7000      -- how much time it stays in a camera before changing, in miliseconds

Config.TransitionTime                = 4000      -- how much time it takes to go from one camera to another (camera movement), in miliseconds

Config.ShakeAmplitude                = 0.2       -- camera shake

Config.UseKMh                        = true      -- true = use KM/h | false = use miles/h

Config.MaxVehiclesSpeed              = 450       -- Max speed a vehicle can go at (it is only used for UI purposes, it does NOT change the speed of a vehicle)

Config.TestDriveTime                 = 40        -- In seconds

Config.StopTestDriveCmd              = "cancel"  -- command to stop the test drive

Config.PlateLetters                  = 3         -- How many letters the plate has

Config.PlateNumbers                  = 3         -- How many numbers the plate has

Config.PlateUseSpace                 = true      -- If the plate uses spaces between letters and numbers

Config.OrderReceivePercentage        = true      -- If true = players will receive a percentage of the vehicle price (Config.OrderCompletedPercentage) | if false = players receive a flat rate (Config.OrderCompletedFlatRate)

Config.OrderCompletedPercentage      = 10        -- When a employee completes the misson he will get this percentage as a reward, 10 = 10% (Config.OrderReceivePercentage = true)

Config.OrderCompletedFlatRate        = 1000      -- When a employee completes the misson he will get paid this value (Config.OrderReceivePercentage = false)

Config.HireRange                     = 3         -- How close a player needs to be to be in the hiring range

Config.AdminCommand                  = "vsadmin" -- command to open the admin menu

Config.OwnerBuyVehiclePercentage     = 10        -- How much of a discount the owner has to order a vehicle (bases on the min. price)

Config.SellBusinessReceivePercentage = 50        -- How much a player will receive for selling his business (in percentage, 50 = 50%)

Config.ClearMoneyWhenBusinessIsSold  = false     -- true = remove the money from the society when sold | false = do not remove the money

Config.MaxDealershipsPerPlayer       = 2         -- How many vehicle shops a player can own

Config.MaxEmployeesPerDealership     = 10        -- How many employees a vehicle shop can hire

Config.EnableSellVehicle             = false     -- Allows players to sell their vehicles for a percentage of the vehicle's min price

Config.VehicleShopBuyVehicle         = false     -- true = when selling a bought vehicle the money will be discounted from the vehicle shop and the vehicle added to the stock | false = vehicle shop will not be charged or receive the vehicle

Config.VehicleSellPercentage         = 40        -- 40 = seller will receive 40% of the vehicle min. price

Config.EnableOkokBankingTransactions = true      -- true = when you buy a vehicle a transaction is added (okokBanking)

Config.AdminGroups                   = {         -- Admin groups that can access the admin menu
	"owner",
	"admin"
}

Config.JobRanks                      = { -- These are the ranks available on the vehicle shops, you can add or remove as many as you want but leave at least 1
	"Newbie",                            -- ID: 1
	"Experienced",                       -- ID: 2
	"Expert",                            -- ID: 3
	"Sub-Owner"                          -- ID: 4
}

Config.SubOwnerRank                  = 4                                                                      -- ID of the rank that will work as a secondary owner

Config.MissionForStock               = false                                                                  -- false = when you order a vehicle, the vehicle shop will instantly receive it without doing any order/mission

Config.TruckBlip                     = { blipId = 67, blipColor = 2, blipScale = 0.9, blipText = "Truck" }    -- Blip of the truck when someone accepts an order

Config.TrailerBlip                   = { blipId = 515, blipColor = 2, blipScale = 0.9, blipText = "Trailer" } -- Blip of the trailer when someone accepts an order (for vehicle shops with big vehicles)

Config.OrderBlip                     = { blipId = 478, blipColor = 5, blipText = "Order" }                    -- Blip of the ordered vehicle when someone accepts an order

Config.TowMarker                     = {
	id = 21,
	size = { x = 0.5, y = 0.5, z = 0.5 },
	color = { r = 31, g = 94, b = 255, a = 90 },
	bobUpAndDown = 0,
	faceCamera = 0,
	rotate = 1,
	drawOnEnts = 0
}                                                                                                            -- The marker to tow a vehicle when someone accepts an order

Config.SmallTowTruckID               = "flatbed"

Config.BigTowTruckID                 = "Hauler"

Config.TrailerID                     = "TRFlat"

Config.Aircrafts                     = { -- Add all of your aircrafts here so the script sets them as aircrafts in the database.
}

Config.Boats                         = { -- Add all of your boats here so the script sets them as boats in the database.
}

Config.Stands                        = { -- Vehicle shops informations
	{
		name = "Concessionária",
		licenseType = "",
		currency = "bank",
		hasOwner = false, -- when this is false you don't need all the config elements but dont forget to add on Config.ShowVehicle and Config.TransitionCamerasOffset
		coords = { x = -46.80, y = -1095.76, z = 27.27 },
		ownerCoords = { x = -70.91, y = -1097.0243, z = 26.4223 },
		sellVehicleCoords = { x = -70.91, y = -1123.73, z = 24.60 },
		sellVehicleMarker = {
			id = 1,
			color = { r = 255, g = 0, b = 0, a = 90 },
			size = { x = 4.0, y = 4.0, z = 1.5 },
			radius = 2.5,
			bobUpAndDown = 0,
			faceCamera = 0,
			rotate = 1,
			drawOnEnts = 0
		},
		radius = 1,
		blip = { blipId = 225, blipColor = 3, blipScale = 0.7, blipText = "Concessionária" },
		buyBlip = { blipId = 0, blipColor = 0, blipScale = 0, blipText = "Vender" },
		marker = {
			id = 20,
			color = { r = 31, g = 94, b = 255, a = 90 },
			size = { x = 0.5, y = 0.5, z = 0.5 },
			bobUpAndDown = 0,
			faceCamera = 0,
			rotate = 1,
			drawOnEnts = 0
		},
		type = "vehicles",
		id = "vehicles1",
	},
	{
		name = "Concessionária",
		licenseType = "",
		currency = "bank",
		hasOwner = false, -- when this is false you don't need all the config elements but dont forget to add on Config.ShowVehicle and Config.TransitionCamerasOffset
		coords = { x = -949.5, y = -2946.55, z = 13.95 },
		ownerCoords = { x = -70.91, y = -1123.73, z = 24.60 },
		sellVehicleCoords = { x = -70.91, y = -1123.73, z = 24.60 },
		sellVehicleMarker = {
			id = 1,
			color = { r = 255, g = 0, b = 0, a = 90 },
			size = { x = 4.0, y = 4.0, z = 1.5 },
			radius = 2.5,
			bobUpAndDown = 0,
			faceCamera = 0,
			rotate = 1,
			drawOnEnts = 0
		},
		radius = 1,
		blip = { blipId = 64, blipColor = 3, blipScale = 0.7, blipText = "Concessionária" },
		buyBlip = { blipId = 0, blipColor = 0, blipScale = 0, blipText = "Vender" },
		marker = {
			id = 20,
			color = { r = 31, g = 94, b = 255, a = 90 },
			size = { x = 0.5, y = 0.5, z = 0.5 },
			bobUpAndDown = 0,
			faceCamera = 0,
			rotate = 1,
			drawOnEnts = 0
		},
		type = "air",
		id = "air1",
	},
	{
		name = "Concessionária",
		licenseType = "",
		currency = "bank",
		hasOwner = false, -- when this is false you don't need all the config elements but dont forget to add on Config.ShowVehicle and Config.TransitionCamerasOffset
		coords = { x = -720.77, y = -1324.92, z = 1.6 },
		ownerCoords = { x = -70.91, y = -1123.73, z = 24.60 },
		sellVehicleCoords = { x = -70.91, y = -1123.73, z = 24.60 },
		sellVehicleMarker = {
			id = 1,
			color = { r = 255, g = 0, b = 0, a = 90 },
			size = { x = 4.0, y = 4.0, z = 1.5 },
			radius = 2.5,
			bobUpAndDown = 0,
			faceCamera = 0,
			rotate = 1,
			drawOnEnts = 0
		},
		radius = 1,
		blip = { blipId = 427, blipColor = 3, blipScale = 0.7, blipText = "Concessionária" },
		buyBlip = { blipId = 0, blipColor = 0, blipScale = 0, blipText = "Vender" },
		marker = {
			id = 20,
			color = { r = 31, g = 94, b = 255, a = 90 },
			size = { x = 0.5, y = 0.5, z = 0.5 },
			bobUpAndDown = 0,
			faceCamera = 0,
			rotate = 1,
			drawOnEnts = 0
		},
		type = "water",
		id = "water1",
	},
}

Config.ShowVehicle                   = {
	-- Display vehicle
	["vehicles1"] = { -- ID of the vehicle shop
		playerOffsetVehiclePreview = { x = 0.0, y = 0.0, z = -1.0 },
		position = { x = -47.49, y = -1091.75, z = 26.62, h = 244.81 },
		noVehicleCam = { x = -32.95 - 1.49, y = -1097.48 - 7.65, z = 27.27 + 1.15 },
		testDrive = { x = -1733.25, y = -2901.43, z = 13.94, h = 330.0 },
		vehicleSpawn = { -- Where the vehicle spawns when bought
			{ x = -27.65, y = -1082.03, z = 26.64, h = 70.0 },
			{ x = -13.61, y = -1092.4,  z = 26.67, h = 340.0 },
			{ x = -12.16, y = -1082.49, z = 26.68, h = 84.0 },
		},
	},
	["air1"] = {
		position = { x = -1652.0, y = -3142.69, z = 13.99, h = 70.0 },
		playerOffsetVehiclePreview = { x = 0.0, y = 0.0, z = 0.0 },
		noVehicleCam = { x = -1652.0 - 12.49, y = -3142.69 - 0.65, z = 13.99 + 2.15 },
		testDrive = { x = -1733.25, y = -2901.43, z = 13.94, h = 330.0 },
		vehicleSpawn = {
			{ x = -1023.91, y = -3060.6, z = 13.94, h = 70.0 },
		},
	},
	["water1"] = {
		position = { x = -828.54, y = -1448.08, z = -0.5, h = 70.0 },
		playerOffsetVehiclePreview = { x = 0.0, y = 0.0, z = 0.0 },
		noVehicleCam = { x = -828.54 - 12.49, y = -1448.08 - 0.65, z = -0.5 + 3.15 },
		testDrive = { x = -878.02, y = -1360.32, z = 2.0, h = 330.0 },
		vehicleSpawn = {
			{ x = -706.78, y = -1333.57, z = 2.0, h = 70.0 },
		},
	},
}

Config.TransitionCamerasOffset       = {
	-- Cameras positions, you can add as many as you wish
	["vehicles1"] = { -- ID of the vehicle shop
		{ x = 1.49,  y = 7.65, z = 1.15 },
		{ x = 14.0,  y = 5.0,  z = 0.6 },
		{ x = 7.0,   y = -5.0, z = 1.5 },
		{ x = -15.0, y = -3.0, z = 1.6 },
	},
	["air1"] = {
		{ x = 12.49, y = 0.65,  z = 2.15 },
		{ x = 9.0,   y = 20.0,  z = 1.6 },
		{ x = -13.5, y = 8.0,   z = 2.5 },
		{ x = -4.0,  y = -13.0, z = 2.6 },
	},
	["water1"] = {
		{ x = 12.49, y = 0.65,  z = 3.15 },
		{ x = 9.0,   y = 20.0,  z = 2.6 },
		{ x = -13.5, y = 8.0,   z = 3.5 },
		{ x = -4.0,  y = -13.0, z = 3.6 },
	},
}

Config.VehicleshopsCategories        = {
	-- Categories shown on the vehicle shops, this is used to set the vehicles category
	["vehicles"] = { -- TYPE of the vehicle shop
		{ display = "ALFA ROMEO",   id = "alfaromeo" },
		{ display = "ASTON MARTIN", id = "astonmartin" },
		{ display = "AUDI",         id = "audi" },
		{ display = "BENTLEY",      id = "bentley" },
		{ display = "BMW",          id = "bmw" },
		{ display = "BRABUS",       id = "brabus" },
		{ display = "BUGATTI",      id = "bugatti" },
		{ display = "CITROEN",      id = "citroen" },
		{ display = "DODGE",        id = "dodge" },
		{ display = "FERRARI",      id = "ferrari" },
		{ display = "FORD",         id = "ford" },
		{ display = "HONDA",        id = "honda" },
		{ display = "JAGUAR",       id = "jaguar" },
		{ display = "JEEP",         id = "jeep" },
		{ display = "LAMBORGHINI",  id = "lamborghini" },
		{ display = "LYCAN",        id = "lykan" },
		{ display = "MASERATI",     id = "maserati" },
		{ display = "MAZDA",        id = "mazda" },
		{ display = "MCLAREN",      id = "mclaren" },
		{ display = "MERCEDES",     id = "mercedes" },
		{ display = "MITSUBISHI",   id = "mitsubishi" },
		{ display = "MOTAS",        id = "motas" },
		{ display = "NISSAN",       id = "nissan" },
		{ display = "OPEL",         id = "opel" },
		{ display = "PAGANI",       id = "pagani" },
		{ display = "PEUGEOT",      id = "peugeot" },
		{ display = "PORSCHE",      id = "porsche" },
		{ display = "RANGE ROVER",  id = "rangerover" },
		{ display = "RENAULT",      id = "renault" },
		{ display = "ROLLS ROYCE",  id = "rollsroyce" },
		{ display = "SEAT",         id = "seat" },
		{ display = "TESLA",        id = "tesla" },
		{ display = "TOYOTA",       id = "toyota" },
		{ display = "VOLKSWAGEN",   id = "volkswagen" },
		{ display = "VIP",          id = "vip" },
	},
	["air"] = {
		{ display = "Helicópteros", id = "helicopteros" },
	},
	["water"] = {
		{ display = "BARCOS", id = "barcos" },
	},

}

Config.UseColorID                    = false -- Will set the vehicle color based on the color ID: https://wiki.rage.mp/index.php?title=Vehicle_Colors

Config.colors                        = {
	-- The vehicle colors, this will update the UI as well (it needs to be 10 colors, do NOT remove, add or change the color names)
	color1 = { 255, 255, 255, id = 134 }, -- The 4th number is the color id for the car if Config.UseColorID = true
	color2 = { 0, 0, 0, id = 0 },
	color3 = { 150, 150, 150, id = 4 },
	color4 = { 255, 0, 0, id = 27 },
	color5 = { 255, 150, 0, id = 41 },
	color6 = { 255, 230, 0, id = 89 },
	color7 = { 0, 255, 0, id = 55 },
	color8 = { 0, 0, 255, id = 79 },
	color9 = { 76, 0, 255, id = 145 },
	color10 = { 255, 0, 255, id = 137 },
}

Config.TextUI                        = {
	-- Text UI texts
	['open_shop'] = { text = '[E] Abrir ${shop_name}', color = 'darkblue', side = 'right' },
	['buy_business'] = { text = '[E] to buy ${name} for ${price}€', color = 'darkblue', side = 'right' },
	['access_business'] = { text = '[E] to access ${name}', color = 'darkblue', side = 'right' },
	['tow'] = { text = '[E] To tow', color = 'darkblue', side = 'right' },
	['sell_vehicle'] = { text = '[E] To sell vehicle', color = 'darkblue', side = 'right' },
}

Config.HelpNotification              = {
	-- Used when Config.UseTextUI = false
	['open_shop'] = { text = '~INPUT_CONTEXT~ To open ${shop_name}' },
	['buy_business'] = { text = '~INPUT_CONTEXT~ to buy ${name} for ${price}€' },
	['access_business'] = { text = '~INPUT_CONTEXT~ to access ${name}' },
	['tow'] = { text = '~INPUT_CONTEXT~ To tow' },
	['sell_vehicle'] = { text = '~INPUT_CONTEXT~ To sell vehicle' },
}

Config.NotificationsText             = {
	-- Notifications texts
	['success_cancel'] = { title = "Vehicle Shop", text = "Successfully canceled the order", time = 5000, type =
	"success" },
	['fail_cancel'] = { title = "Vehicle Shop", text = "Failed to cancel the order", time = 5000, type = "error" },
	['cant_access'] = { title = "Vehicle Shop", text = "You don't have permission to access this shop", time = 5000, type =
	"error" },
	['no_license'] = { title = "Vehicle Shop", text = "You have no license to buy this vehicle", time = 5000, type =
	"error" },
	['all_occupied'] = { title = "Vehicle Shop", text = "All vehicle entrances are occupied", time = 5000, type = "error" },
	['failed_to_load'] = { title = "Vehicle Shop", text = "Failed to load the vehicle", time = 5000, type = "error" },
	['bus_no_money'] = { title = "Vehicle Shop", text = "This business doesn't have enough money", time = 5000, type =
	"error" },
	['success_sell'] = { title = "Vehicle Shop", text = "You sold ${vehicle_name} for ${price}€ successfully", time = 5000, type =
	"success" },
	['not_in_correct_v'] = { title = "Vehicle Shop", text = "You are not in the correct vehicle", time = 5000, type =
	"error" },
	['dont_sell'] = { title = "Vehicle Shop", text = "This vehicle shop don't buy this vehicle", time = 5000, type =
	"error" },
	['not_your_vehicle'] = { title = "Vehicle Shop", text = "You don't own this vehicle", time = 5000, type = "error" },
	['not_in_vehicle'] = { title = "Vehicle Shop", text = "You need to be on a vehicle", time = 5000, type = "error" },
	['not_admin'] = { title = "Vehicle Shop", text = "You don't have permission to access the admin menu", time = 5000, type =
	"error" },
	['inside_vehicle'] = { title = "Vehicle Shop", text = "You can't access the vehicle shop inside a vehicle", time = 5000, type =
	"error" },
	['load_vehicle'] = { title = "Vehicle Shop", text = "Loading vehicle, please wait", time = 3000, type = "info" },
	['stop_testdrive'] = { title = "Vehicle Shop", text = "Stopping the test drive", time = 5000, type = "success" },
	['not_testdriving'] = { title = "Vehicle Shop", text = "You are not on a test drive", time = 5000, type = "error" },
	['fill_fields'] = { title = "Vehicle Shop", text = "Please fill the input field", time = 5000, type = "error" },
	['already_accepted'] = { title = "Vehicle Shop", text =
	"You already accepted an order, complete it before accepting another", time = 5000, type = "error" },
	['not_selected_hire'] = { title = "Vehicle Shop", text = "No one was selected", time = 5000, type = "error" },
	['ordered_success'] = { title = "Vehicle Shop", text = "You ordered x${amount} ${vehicle_name} successfully!", time = 5000, type =
	"success" },
	['some_wrong'] = { title = "Vehicle Shop", text = "Something went wrong!", time = 5000, type = "error" },
	['not_enough_money'] = { title = "Vehicle Shop", text = "You don't have enough money", time = 5000, type = "error" },
	['not_enough_money_s'] = { title = "Vehicle Shop", text = "Your society doesn't have enough money", time = 5000, type =
	"error" },
	['accepted_order'] = { title = "Vehicle Shop", text = "You accepted an order successfully", time = 5000, type =
	"success" },
	['someone_accepted'] = { title = "Vehicle Shop", text = "Someone has already accepted this order", time = 5000, type =
	"error" },
	['finished_order'] = { title = "Vehicle Shop", text = "You successfully finished the order and received ${reward}€", time = 5000, type =
	"success" },
	['no_ads_cancel'] = { title = "Vehicle Shop", text = "You don't have any ads to cancel", time = 5000, type = "error" },
	['veh_not_available'] = { title = "Vehicle Shop", text = "This vehicle isn't available", time = 5000, type = "error" },
	['price_not_valid'] = { title = "Vehicle Shop", text = "This is not a valid price", time = 5000, type = "error" },
	['employee_not_exist'] = { title = "Vehicle Shop", text = "This employee does not exist", time = 5000, type = "error" },
	['not_enough_to_sell'] = { title = "Vehicle Shop", text = "You don't have enough vehicles to sell", time = 5000, type =
	"error" },
	['got_hired'] = { title = "Vehicle Shop", text = "You got hired by ${shop_name}", time = 5000, type = "info" },
	['got_fired'] = { title = "Vehicle Shop", text = "You got fired by ${shop_name}", time = 5000, type = "info" },
	['success_hired'] = { title = "Vehicle Shop", text = "You successfully hired ${hired_name}", time = 5000, type =
	"success" },
	['success_fired'] = { title = "Vehicle Shop", text = "You successfully fired ${fired_name}", time = 5000, type =
	"success" },
	['success_added_ad'] = { title = "Vehicle Shop", text = "Added x${amount} ${vehicle_name} ads", time = 5000, type =
	"success" },
	['deposited'] = { title = "Vehicle Shop", text = "Deposited ${amount}€ successfully", time = 5000, type = "success" },
	['withdrawn'] = { title = "Vehicle Shop", text = "Whitdrawn ${amount}€ successfully", time = 5000, type = "success" },
	['bought_veh'] = { title = "Vehicle Shop", text = "Bought ${vehicle_name} for ${vehiclePrice}€", time = 5000, type =
	"success" },
	['change_money'] = { title = "Vehicle Shop", text = "Changed the ${shop_name} money to ${money} successfully", time = 5000, type =
	"success" },
	['change_info'] = { title = "Vehicle Shop", text = "Changed the ${vehicle_name} informations successfully", time = 5000, type =
	"success" },
	['remove_veh'] = { title = "Vehicle Shop", text = "Removed the ${vehicle_name} successfully", time = 5000, type =
	"success" },
	['created_veh'] = { title = "Vehicle Shop", text = "Created a ${vehicle_name} successfully", time = 5000, type =
	"success" },
	['cancel_ads'] = { title = "Vehicle Shop", text = "Canceled x${amount} ${vehicle_name} ads", time = 5000, type =
	"success" },
	['updated_price'] = { title = "Vehicle Shop", text = "Updated price of ${vehicle_name} to ${amount}€", time = 5000, type =
	"success" },
	['change_rank'] = { title = "Vehicle Shop", text = "${name} is now a ${job}", time = 5000, type = "success" },
	['already_rank'] = { title = "Vehicle Shop", text = "${name} is already a ${job}", time = 5000, type = "error" },
	['already_employee'] = { title = "Vehicle Shop", text = "${name} is your employee already", time = 5000, type =
	"error" },
	['max_shops'] = { title = "Vehicle Shop", text = "You can't buy more dealerships", time = 5000, type = "error" },
	['got_to_truck'] = { title = "Vehicle Shop", text = "Go get the order marked in your minimap", time = 5000, type =
	"info" },
	['not_towing'] = { title = "Vehicle Shop", text = "You need to be closer to the ordered vehicle", time = 5000, type =
	"error" },
	['towed'] = { title = "Vehicle Shop", text = "You successfully towed the ordered vehicle", time = 5000, type =
	"success" },
	['sold_business'] = { title = "Vehicle Shop", text = "You successfully sold ${shop} for ${amount}€", time = 5000, type =
	"success" },
	['leave_business'] = { title = "Vehicle Shop", text = "You successfully left ${shop}", time = 5000, type = "success" },
	['min_max_price'] = { title = "Vehicle Shop", text = "The minimum price needs to be less than the maximum price", time = 5000, type =
	"error" },
	['owner_changed'] = { title = "Vehicle Shop", text = "${owner} is now the owner of ${shop}", time = 5000, type =
	"success" },
	['max_employees'] = { title = "Vehicle Shop", text = "You can only hire ${employees} employees", time = 5000, type =
	"error" },
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to webhook.lua, line 1

Config.BotName                       = 'Logs Concessionária' -- Write the desired bot name

Config.ServerName                    = 'Natural RP'          -- Write your server's name

Config.IconURL                       = ''                    -- Insert your desired image link

Config.DateFormat                    = '%d/%m/%Y [%X]'       -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.BuyBusinessWebhook            = true
Config.BuyBusinessWebhookColor       = '65280'

Config.SellBusinessWebhook           = true
Config.SellBusinessWebhookColor      = '16711680'

Config.DepositWebhook                = true
Config.DepositWebhookColor           = '16776960'

Config.WithdrawWebhook               = true
Config.WithdrawWebhookColor          = '16776960'

Config.StartOrderWebhook             = true
Config.StartOrderWebhookColor        = '16742656'

Config.EndOrderWebhook               = true
Config.EndOrderWebhookColor          = '16742656'

Config.HireWebhook                   = true
Config.HireWebhookColor              = '4223487'

Config.FireWebhook                   = true
Config.FireWebhookColor              = '4223487'

Config.BuyVehicleWebhook             = true
Config.BuyVehicleWebhookColor        = '65535'

Config.ADStockWebhook                = true
Config.ADStockWebhookColor           = '7209071'

Config.CancelStockWebhook            = true
Config.CancelStockWebhookColor       = '7209071'

Config.BuyStockWebhook               = true
Config.BuyStockWebhookColor          = '7209071'

Config.EditEmployeeRankWebhook       = true
Config.EditEmployeeRankWebhookColor  = '4223487'

Config.QuitJobWebhook                = true
Config.QuitJobWebhookColor           = '16711680'

Config, Locales = {}, {}

Config.Debug = false -- This help find the source of a problem

Config.OnlyUnpaidCityInvoices = false

Config.OnlyUnpaidSocietyInvoices = false

Config.EventPrefix = 'okokBilling'

Config.Locale = 'pt'

Config.DatabaseTable = 'okokbilling'

Config.OpenMenuKey = 168           -- Default 168 (F7)

Config.OpenMenuCommand = 'faturas' -- Command to open the menu

Config.InvoiceDistance = 15

Config.AllowPlayersInvoice = false       -- if players can create Player to Player invoices

Config.okokRequests = false              -- Player to Player invoices only, to avoid abuse

Config.AuthorReceivesAPercentage = false -- When sending a society invoice

Config.AuthorPercentage = 10             -- Percentage that the invoice author receives

Config.VATPercentage = 23

Config.SocietyReceivesLessWithVAT = true

Config.AddonAccount = true            -- If set to true it will use the addon_account_data table in the database, if set to false it will use the okokBanking tables

Config.SocietyHasSocietyPrefix = true -- *Do not touch this if the resource is working correctly* If set to true it'll search for `society_police` (example) when paying a society invoice

-- Autopay

Config.UseAutoPay = true

Config.DefaultLimitDate = 7             -- Days for limit pay date

Config.CheckForUnpaidInvoicesEvery = 30 -- minutes

Config.FeeAfterEachDay = true

Config.FeeAfterEachDayPercentage = 5

-- Autopay

Config.JobsWithCityInvoices = { -- Which jobs have City Invoices (They will be allowed to delete any invoice) | Admins will have access by default
}

Config.CityInvoicesAccessRanks = { -- Which jobs have City Invoices (They will be allowed to delete any invoice)
    ''                             -- All of them have access
}

Config.AllowedSocieties = { -- Which societies can access the Society Invoices
    'police',
    'ambulance'
}

Config.InspectCitizenSocieties = { -- Which societies can access the Society Invoices
}

Config.SocietyAccessRanks = { -- Which ranks of the society have access to Society Invoices and City Invoices
    'boss',
    'chief',
}

Config.BillsList = {
    ['police'] = {
        { 'High Speed',          550 },
        { 'Parking on bridge',   1200 },
        { 'Jumping a red light', 250 },
        { 'Driving dangerously', 750 },
        { 'Reckless driving',    1000 },
        { 'Custom' }, -- If set without a price it'll let the players create a custom invoice (custom price)
    },
    ['ambulance'] = {
        { 'Ambulance Ride',      550 },
        { 'Medical treatment 1', 750 },
        { 'Medical treatment 2', 1200 },
        { 'Medical treatment 3', 250 },
        { 'Medical treatment 4', 400 },
    },
}

Config.AdminGroups = {
    'owner',
    'admin'
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to sv_utils.lua, line 5

Config.BotName = 'Logs Faturas'       -- Write the desired bot name

Config.ServerName = 'Natural Roleplay'    -- Write your server's name

Config.IconURL = ''                 -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.CreatePersonalInvoiceWebhookColor = '65535'

Config.CreateJobInvoiceWebhookColor = '16776960'

Config.CancelInvoiceWebhookColor = '16711680'

Config.PayInvoiceWebhookColor = '65280'

-------------------------- LOCALES (DON'T TOUCH)

function _L(id)
    if Locales[Config.Locale][id] then
        return Locales[Config.Locale][id]
    else
        print('Locale ' .. id .. ' doesn\'t exist')
    end
end

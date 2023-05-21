Config = {}

Config.Debug = false

Config.Framework = 'ESX' -- ESX / QB / STANDALONE

Config.UseNewStaffCheckMethod = false -- **QBCORE and ESX ONLY** true = will check if a player is staff in another way (this could fix problems with /repots command)

Config.QBPermissionsUpdate = false -- **QBCORE ONLY** - set it to true if you have the latest Permissions update

Config.ReportCommand = 'report' -- command for players to create a report

Config.AdminReportCommand = 'reports' -- command for admins to check the reports

Config.NotificationToggleCommand = 'rn' -- command to toggle the notifications

Config.UseSteamNames = true -- Uses the steam names insted of game names

Config.SaveRespondedReports = true -- This will save how many reports the admins complete in the database (for this you need to use the sql file and set your sql script in the fxmanifest.lua)

Config.Database = 'oxmysql' -- mysql-async / oxmysql / ghmattimysql (Used if Config.SaveRespondedReports is set to true)

Config.NoAdminAssistingText = 'Não atendido'

Config.TeleportBackAfterConcluding = true

Config.NewReportNotifyType = 'STANDALONE' -- QB or STANDALONE

Config.LatestSendNotifyToAdmin = true

Config.GetAllPlayersForNotify = false

Config.ReportCategoriesTranslation = { -- Translate report categories
	player = "REPORTAR JOGADOR",
	bug = "BUG",
	question = "QUESTÃO"
}

Config.AdminGroups = { -- Used for ESX and QB
    'owner',
    'admin'
}

-- Used to set the admins when using the STANDALONE version
-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.StandaloneStaffIdentifiers = { 
	'license:9asg8d9812g3989as8dy8912398123y89123y221', -- Example, change this
	'license:09asyhhdh8912h389asgdhh912g389asgd98y123' -- Example, change this
}

Config.Notifications = {
	['success_rep'] = {title = 'REPORT', text = 'Report aberto com sucesso', time = 5000, type = 'success'},
	['adm_answered'] = {title = 'REPORT', text = 'Report respondido', time = 5000, type = 'info'},
	['player_answered'] = {title = 'REPORT', text = '#${id} - ${name} respondeu-te', time = 5000, type = 'info'},
	['adm_assist'] = {title = 'REPORT', text = 'Report atendido', time = 5000, type = 'info'},
	['rep_concluded'] = {title = 'REPORT', text = 'Report concluído', time = 5000, type = 'success'},
	['rep_canceled'] = {title = 'REPORT', text = 'Report cancelado', time = 5000, type = 'error'},
	['adm_rep_concluded'] = {title = 'REPORT', text = 'Report #${id} concluído', time = 5000, type = 'success'},
	['new_rep'] = {title = 'REPORT', text = 'Novo report aberto', time = 5000, type = 'info'},
	['rep_not_on'] = {title = 'REPORT', text = 'Notificações de reports ligadas', time = 5000, type = 'success'},
	['rep_not_off'] = {title = 'REPORT', text = 'Notificações de reports desligadas', time = 5000, type = 'error'},
	['rep_not_exist'] = {title = 'REPORT', text = 'Report não existe', time = 5000, type = 'error'},
}

Config.CommandSuggestions = {
	['report'] = {text = 'Comando usado para abrir um report'},
	['adm_report'] = {text = 'Comando usado para ver os reports abertos'},
	['adm_notifications'] = {text = 'Comando para ativar/desativar notificações'},
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to webhook.lua, line 1

Config.BotName = 'Logs Reports' -- Write the desired bot name

Config.ServerName = 'Natural Roleplay' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

Config.ReportTitle = 'REPORT'

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.playerReportWebhookColor = '65280'

Config.bugReportWebhookColor = '16711680'

Config.questionReportWebhookColor = '49151'

Config.playerWebhookColor = '255'

Config.adminWebhookColor = '16746240'

Config.WebhookMessages = {
	-- Player
	['player_report'] = {action = 'Opened a report'},
	['bug_report'] = {action = 'Opened a report'},
	['question_report'] = {action = 'Opened a report'},
	['p_cancel_report'] = {action = 'Canceled a report', type = 'Report #${id}'},
	['p_answer_report'] = {action = 'Player answered report', type = 'Report #${id}'},

	-- Admin
	['a_answer_report'] = {action = 'Admin answered report', type = 'Report #${id}'},
	['a_bring_report'] = {action = 'Admin brought the player', type = 'Report #${id}'},
	['a_goto_report'] = {action = 'Admin went to the player', type = 'Report #${id}'},
	['a_closed_report'] = {action = 'Admin closed a report', type = 'Report #${id}'},
}
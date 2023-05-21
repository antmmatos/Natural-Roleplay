
--░██╗░░░░░░░██╗███████╗██████╗░██╗░░██╗░█████╗░░█████╗░██╗░░██╗░██████╗
--░██║░░██╗░░██║██╔════╝██╔══██╗██║░░██║██╔══██╗██╔══██╗██║░██╔╝██╔════╝
--░╚██╗████╗██╔╝█████╗░░██████╦╝███████║██║░░██║██║░░██║█████═╝░╚█████╗░
--░░████╔═████║░██╔══╝░░██╔══██╗██╔══██║██║░░██║██║░░██║██╔═██╗░░╚═══██╗
--░░╚██╔╝░╚██╔╝░███████╗██████╦╝██║░░██║╚█████╔╝╚█████╔╝██║░╚██╗██████╔╝
--░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░

--- @param Important, add a webhook here, otherwise the images won't work.
Config.Webhook = 'https://discord.com/api/webhooks/1107317090593030276/f5gN42zclOsHhaT6zz9poZzFPtOSO96ZoFge_-jIEnyRN-obBHBYdsSKEl4ENiCgq58a'             --- @param Set your own discord Webhook here.
Config.TwitterWebhook = 'https://discord.com/api/webhooks/1107317825518973009/d0fhmdgih7sQcDLC7uwnNgw-XWWTKVjdLs60GPcXHsa98I1zVSJKw-O6HI1cnhndD6w3'      --- @param Set your own discord Webhook here.
Config.InstagramWebhook = 'https://discord.com/api/webhooks/1107318581798113390/w_R-Gr4VKiBRsrL01nhtpi5bQ0FEuE689lm63jX62Qtf9ZVemIirR7ZPToxa71ss_uxq'    --- @param Set your own discord Webhook here.
Config.YellowPagesWebhook = 'https://discord.com/api/webhooks/1107319589198647336/Vj0i2YCaRZy4JSDhMqcR4nmHfcxWnsrNAmNOuirGcL6cINS-ZnW4MYYAIa9OOvqfFWWs'  --- @param Set your own discord Webhook here.
Config.NewsWebhook = 'https://discord.com/api/webhooks/1107319639136022589/dUB2X1TOBu9afhlp-DfhCmIcs7A3-s8PheQRy_bYm6Vx-IvkWVPbI2QSV9Fyg4EZxDlT'         --- @param Set your own discord Webhook here.

-- Webhooks for social media posts, all of these can be public for your players to see the webhooks on your discord server!
Config.PublicWebhookFooter = ''
Config.WebhookImage = ''

Config.Webhooks = { -- Enable or disable webhooks.
    twitter = true,
    instagram = true,
    yellowpages = true,
    news = true,
}

Config.WebhooksTranslations = { -- All webhook translations.
    ['twitter'] = {
        name = 'Twitter',
        title = 'New Tweet!',
        username = '**Username**: @',
        description = '\n**Description**: ',
        image = 'https://media.discordapp.net/attachments/926274292373655562/999492805770608710/twitter.png'
    },

    ['instagram'] = {
        name = 'Instagram',
        title = 'New Post!',
        username = '**Username**: @',
        description = '\n**Description**: ',
        image = 'https://media.discordapp.net/attachments/926274292373655562/999504825450500157/instagram.png'
    },

    ['yellowpages'] = {
        name = 'Yellow Pages',
        title = 'New Post!',
        username = '**Username**: ',
        description = '\n**Description**: ',
        number = '\n**Number**: ',
        image = 'https://media.discordapp.net/attachments/926274292373655562/999508700907700234/yellow_pages.png'
    },

    ['news'] = {
        name = 'News',
        title = 'New Storie!',
        storie = '**Title**: ',
        description = '\n**Description**: ',
        date = '\n**Number**: ',
        image = 'https://media.discordapp.net/attachments/989917195972788234/1002266182994362379/weazel.png'
    },
}

--░██╗░░░░░░░██╗███████╗██████╗░██╗░░██╗░█████╗░░█████╗░██╗░░██╗░██████╗
--░██║░░██╗░░██║██╔════╝██╔══██╗██║░░██║██╔══██╗██╔══██╗██║░██╔╝██╔════╝
--░╚██╗████╗██╔╝█████╗░░██████╦╝███████║██║░░██║██║░░██║█████═╝░╚█████╗░
--░░████╔═████║░██╔══╝░░██╔══██╗██╔══██║██║░░██║██║░░██║██╔═██╗░░╚═══██╗
--░░╚██╔╝░╚██╔╝░███████╗██████╦╝██║░░██║╚█████╔╝╚█████╔╝██║░╚██╗██████╔╝
--░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░

Config.Webhooks = { -- Place your Discord webhooks here.
    ["drop"] = 'https://discord.com/api/webhooks/1107315109879107674/VCton29NJ5U44SJfRVfuQEMuxDpOSlKcp2Vz2yBt4xNensbWjrTVcg1sk8BDlsv185NG',              --- @param When the player drop a item
    ["shops"] = 'https://discord.com/api/webhooks/1107315157278929026/OFTiR24pUz1n6gxgEW8dKcJhputOOv_YeqtVJBEkjsy5VbfoXBhTcghXYHO-PjXLkVEL',             --- @param When the player buy into qs-shops or trigger of shop
    ["vehicles"] = 'https://discord.com/api/webhooks/1107315239696998410/mjoyPOJeJar-naRXT-Q18skKlRB_oLLrBzZaE-nRfqRVb-YHfjkOQt7LcyCGlESf5UIp',          --- @param When the save a item into trunk
    ["stash"] = 'https://discord.com/api/webhooks/1107315300870930596/AN6Xy2Y50zM2lCBimZu6ATVNfm2ti8XefvTO6kxHPJ0I7xb99QlpISdyAS0WpbKx5Sxn',             --- @param When the save a item into stash
    ["steal"] = 'https://discord.com/api/webhooks/1107315364032946228/Jx1OeGurOEgJuF-PH7d1AslEutY4sCOlvpH0oFMuciaBzQwT-SLeS7MaVIfxZZwUXO7d',             --- @param Show the stealed items when one player steal
    ["garbage"] = 'https://discord.com/api/webhooks/1107315418990923836/ygIlT9UCdtdJ9CHUKxBOEOzTyCdwv3z_fywQk8rozOhodu2dCSni3nr8KMGJkJ70izX9',           --- @param When pick a item from garbage
    ["giveitem"] = 'https://discord.com/api/webhooks/1107315503380303925/W4FjgN21ZV_wFdyEY5b9hhFJiW83nuimbG1G0qPNz18kfc7n3PBHAR4H4SA0KtZOhVbm',          --- @param Give item command
    ["giveitem_admin"] = 'https://discord.com/api/webhooks/1107315563195269150/nVVpLqAilXlfeRrKphEbMeYJYQb199GULQyVCg5kfZoXkrLOZJBPu-jT74fDjv8Xp_iI',    --- @param Give item command
    ["giveweapon_admin"] = 'https://discord.com/api/webhooks/1107315641570054174/caQDoh1WOI42OqbTXDPsF42Xs-6Iyn82y_gY8QlctBK37sqXU_41B42QjIAJskOKfMFQ',  --- @param Give weapon command
    ["distance_check"] = 'https://discord.com/api/webhooks/1107315739091800126/cStZ7s-G_Xge1aKr-_0OrEyvGuKf-Q--Lwp781O-Imc85qvQ0QqJLbT7o8Us8Y7c67id',    --- @param Steal distance checks
    ["admin_log"] = 'https://discord.com/api/webhooks/1107315808545275954/UlsP6vDh6TwkhhvkF_0nCfSLCRZSZan2D7c6baPInhNa1whRUH1ESBeCA1nAwwqJsATM',         --- @param Open inventory by admin
}
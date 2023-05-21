local cfg = {}

cfg.locs = {
    {
        blip = vec3(731.37097167969,-1088.5290527344,21.269008255005), -- localização do blip
        shelf = {cds = vec3(728.76928710938,-1078.3021240234,22.16888999939-1), h = 0.0}, -- localização da estante
        permission = 'desmanche.permissao', -- caso não queira, deixe false
        paymentMultiplier = 50, -- o quando vai pagar em relação ao valor real do carro (em porcentagem)
        prizeItems = { -- itens que serão dados ao final, além do dinheiro (deixe false, ou a tabela vazia caso não queira itens. O item precisa estar cadastrado na base para ser dado.)
            ['portadecarro'] = 1
        }
    }
}

cfg.prohibiteVehicles = { -- veículos proibidos de serem desmanchados
    [`blista`] = true
}

cfg.autoChop = false -- desmanchar veículos próprios (use para testes)

cfg.timeWaitBeforeStart = 20 -- tempo de espera antes do inicio do desmanche (em segundos)

cfg.animationTime = 5 -- tempo que a animação para remover cada peça demora (em segundos)

cfg.keysDisable = {21,22,24,25,29,32,33,34,38,35,56,58,73,75,140,141,142,143,166,167,170,177,182,187,188,189,190,243,245,246,257,263,264,268,269,270,271,288,289,303,311,344} -- keys desabilitadas em alguns ambientes

cfg.webhookWebsite = '' -- seu link de webhook para receber avisos

cfg.distanceToSeeText = 20 -- distancia para ver o texto (x segundos para iniciar o desmanche e entrar no veiculo)

return cfg
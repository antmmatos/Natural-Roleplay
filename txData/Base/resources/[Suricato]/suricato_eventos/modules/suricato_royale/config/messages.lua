local messages = {
    alreadyInRoyale = 'Você já se encontra em um evento de Battle Royale',
    insuficientAmount = 'Quantidade de jogadores insuficientes para um jogo',
    invalidValue = 'Algum dos valores foi inserido de maneira inválida',
    fullEvent = 'O evento está lotado, tente entrar da próxima vez!',
    insuficientGroups = 'Não há grupos suficientes para iniciar',
    alreadyStartedGame = 'Esse evento já foi iniciado',
    teleportedToLobby = 'Você foi teleportado para o lobby',
    alreadyStarted = 'O evento já foi iniciado',
    alreadyOwnThisWeapon = 'Você já possui essa arma!',
    nothaveGunForAmmo = 'Você não possui a arma certa para essa munição!',
    openingChestProgress = 'Abrindo baú',
    controlsHelpChests = '~bold~Para abrir os baús:~h~  %s',
    controlsHelpDrops = '~bold~Para pegar os itens no chão:~h~  %s',
    controlsHelpJumpPlane = '~bold~Para pular do avião:~h~  ~INPUT_JUMP~',
    safezoneWillMove = 'O próximo movimento da tempestade ocorrerá em %s segundos!',
    safezoneIsMoving = 'A tempestade está se movendo!',
    playerNameUndefined = 'Indefinido',
    pressKeyToQuit = 'PRESSIONE %s PARA SAIR DO JOGO',
    groupId = 'Grupo %s',
    waitingSpectator = 'Carregando',

    missingPlayers = function(amount)
        local text = 'Falta%s <strong>%s</strong> jogador%s'

        if amount > 1 then 
            text = text:format('m', amount, 'es')
        else 
            text = text:format('', amount, '')
        end
    
        return text
    end,

    gameModes = { 
        solo = 'Solo',
        duo = 'Duo',
        trio = 'Trio',
        squad = 'Squad'
    },

    keyMappings = {
        chest = 'Abrir baú',
        drop = 'Pegar drop',
        slots = 'Slot %s'
    },

    requests = {
        maxPlayers = 'Quantidade máxima de players',
        prizePool = 'Valor da premiação',
        timeToAnnounce = 'Tempo de anúncio (segundos)'
    },

    announce = {
        eventName = 'Evento Battle Royale',
        participe = 'Para participar digite /participar;',
        prizePool = 'Prêmio R$%s para o grupo vencedor;',
        instructions = 'Ao participar, aguarde o jogo iniciar;'
    },

    endGame = {
        royaleVictory = 'VITÓRIA ROYALE',
        finishBattle = 'FIM DA BATALHA',
        winnerForOthers = 'O <strong>grupo %s</strong> foi o vencedor!',
        winnerToWinner = 'O seu grupo foi campeão!',
        noWinner = 'Nenhum time foi vencedor!'
    },

    winner = {
        title = 'VENCEDORES',
        awardAnnounce = 'Vocês receberam a quantia combinada para o grupo ganhador!',
        awardAmount = 'O valor recebido foi <strong>%s,00</strong>',
        whoReceived = 'Cada integrante do grupo recebeu esse valor.'
    }
}

return messages
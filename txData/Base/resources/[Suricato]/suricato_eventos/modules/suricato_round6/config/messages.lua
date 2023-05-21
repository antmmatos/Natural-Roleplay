local messages = {}

messages['requestReward'] = 'Valor da premiação'

messages['requestPlayersToStart'] = 'Quantidade mínima de players'

messages['noPermission'] = 'Você não possui permissão!'

messages['invalidValue'] = 'Valor inválido'

messages['gameHappening'] = 'Um jogo já está em aberto!'

messages['gameStarted'] = 'Jogo iniciado com sucesso!'

messages['cantParticipate'] = 'Jogo indisponível!'

messages['participate'] = 'Você está participando de um jogo!'

messages['alreadyInGame'] = 'Você já está participando de um jogo!'

messages['focingStartGame'] = 'Forçando inicio de jogo'

messages['alreadyParticipant'] = 'Você já está participando de um jogo!'

messages['gameOpened'] = 
'Um evento de <b>Round6</b> foi iniciado.'..'<br><br>'..
'<b>Premiação:</b> %s'..'<br><br>'..
'Digite <b>/participar</b> para participar do evento!'

messages['gameBegins'] = 'O jogo vai começar em %s segundos!'

messages['warnNumber'] = 'Você é o jogador número %s'

messages['gameSelected'] = 'O jogo selecionado foi %s'

messages['gameDescription'] = '%s'

messages['winMinigame'] = 'Você sobreviveu a esse minigame!'

messages['winMessage'] = 
'PARABÉNS, VOCÊ GANHOU O JOGO!'..'<br>'..
'SEU PRÊMIO: %s'

messages['endRound'] = 'Fim da rodada'

messages['remainPlayers'] = function(remainPlayers)
    local preText = 'Restaram'
    local posText = 'jogadores'

    if remainPlayers == 1 then
        preText = 'Restou'
        posText = 'jogador'
    end

    return preText..' <strong>'..remainPlayers..'</strong> '..posText
end

messages['missingPlayers'] = function(amount)
    local text = 'Falta%s <strong>%s</strong> jogador%s'

    if amount > 1 then 
        text = text:format('m', amount, 'es')
    else 
        text = text:format('', amount, '')
    end

    return text
end

messages['playerEliminated'] = 'Jogador número %s foi eliminado!'

messages['noWinner'] = 'Não houveram vencedores!'

messages['died'] = 'você morreu'

messages['initializeGame'] = 'Iniciando jogo!'

messages['timeLeft'] = 'O jogo irá iniciar em: <strong>%s</strong>'


messages.announce = {}
 
messages.announce['eventName'] = 'Evento Round 6'

messages.announce['command'] = 'Para participar digite /participar;'

messages.announce['prizePool'] = 'Prêmio R$%s para o vencedor;'

messages.announce['instructions'] = 'Ao participar, aguarde o jogo iniciar;'


messages.winner = {}

messages.winner['warn'] = 'Você venceu os jogos'

messages.winner['congratulations'] = 'Parabéns pela vitória!'

messages.winner['award'] = 'Você ganhou R$%s'


messages.maps = {}

messages.maps['bf123-grass'] = 'Terra'

messages.maps['bf123-desert'] = 'Deserto'

messages.maps['theater'] = 'Salão de teatro'

messages.maps['mainRoom'] = 'Salão principal'

messages.maps['platform-sky'] = 'Plataformas no céu'

messages.maps['color-climb'] = 'Color climb'

messages.maps['twisted-towers'] = 'Twisted towers'

messages.maps['cb-sky'] = 'Céu'

messages.maps['dodgeball-sky'] = 'Céu'

messages.maps['default'] = 'Sem nome'


messages.minigames = {}

messages.minigames['cownDown'] = 'O jogo vai começar em %s segundos!'

messages.minigames['youreSeeker'] = 'Você é um assassino! Em 5 segundos você será solto e terá até o fim da rodada para matar alguém e sobreviver! Você possui uma faca para isso, equipe-a!'

messages.minigames['youreTooClose'] = 'Você está muito próximo de outro assassino!'

messages.minigames['youreHider'] = 'Esconda-se dos assassinos para sobreviver!'


messages.spectator = {}

messages.spectator['loading'] = 'CARREGANDO...'

messages.spectator['anonimous'] = 'ANÔNIMO'


messages.bf123 = {}

messages.bf123['youWin'] = 'Você venceu, mas não volte para a zona de jogo!'

messages.bf123['youReturnToGame'] = 'Você voltou para a zona de jogo!'

messages.bf123['gameStarted'] = 'O jogo começou!'


messages.bs = {}

messages.bs['yourTime'] = 'Sua vez! Pressione "E" no botão que você quer! Um deles te mata! Boa sorte!'


messages.cb = {}

messages.cb['youWin'] = 'Você venceu, mas cuidado para não morrer!'


messages.dodgeball = {}

messages.dodgeball['finishGame'] = 'Jogo encerrado'

messages.dodgeball['yourTeamWin'] = 'Seu time foi o <strong>vencedor</strong>'

messages.dodgeball['yourTeamLoss'] = 'Seu time foi o <strong>perdedor</strong>'

return messages
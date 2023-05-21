if Config.QuickAnim.Enabled then 
    
    function HandleQuickAnim(slot)
        if IsPedSprinting(PlayerPedId()) then return end
        if IsPedRunning(PlayerPedId()) then return end
        local prev = UseDefaultFlags
        local animId = GetAnimationFromSet(ActiveSet, slot)
        if not animId then return end
        PlayAnim(animId, flags)
    end


    RegisterCommand('+bindAnim1', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(1)
        end
    end, false)

    RegisterCommand('-bindAnim1', function() end, false)
    
    RegisterKeyMapping('+bindAnim1', Translations.QuickAnim1, 'keyboard', Config.QuickAnim.Key1)

    
    RegisterCommand('+bindAnim2', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(2)
        end
    end, false)

    RegisterCommand('-bindAnim2', function() end, false)
    RegisterKeyMapping('+bindAnim2', Translations.QuickAnim2, 'keyboard', Config.QuickAnim.Key2)


    RegisterCommand('+bindAnim3', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(3)
        end
    end, false)

    RegisterCommand('-bindAnim3', function() end, false)

    RegisterKeyMapping('+bindAnim3', Translations.QuickAnim3, 'keyboard', Config.QuickAnim.Key3)
    
    RegisterCommand('+bindAnim4', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(4)
        end
    end, false)

    RegisterCommand('-bindAnim4', function() end, false)

    RegisterKeyMapping('+bindAnim4', Translations.QuickAnim4, 'keyboard', Config.QuickAnim.Key4)

    RegisterCommand('+bindAnim5', function()
        if IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21) then
            HandleQuickAnim(5)
        end
    end, false)
    
    RegisterCommand('-bindAnim5', function() end, false)

    RegisterKeyMapping('+bindAnim5', Translations.QuickAnim5, 'keyboard', Config.QuickAnim.Key5)

    RegisterNetEvent('rd-animations:PlayQuickAnim', function(target, args)
        HandleQuickAnim(args.id)
    end)

    RegisterCommand(Config.ChangeAnimationSetCommand, function(source, args)
        local value = args[1]
        local number = tonumber(value)
        if number then
            ActiveSet = number
        end
    end)

    RegisterNetEvent('rd-animations:ChangeSet', function(target, args)
        ActiveSet = args.id
    end)
end


function DisableDisplayControlActions() 
    DisableControlAction(0, 24, true) -- Attack
    DisableControlAction(0, 257, true) -- Attack 2
    DisableControlAction(0, 25, true) -- Aim
    DisableControlAction(0, 263, true) -- Melee Attack 1

    DisableControlAction(0, 45, true) -- Reload
    DisableControlAction(0, 22, true) -- Jump
    DisableControlAction(0, 44, true) -- Cover
    DisableControlAction(0, 37, true) -- Select Weapon

    DisableControlAction(0, 288,  true) -- Disable phone
    DisableControlAction(0, 245,  true) -- Disable chat
    DisableControlAction(0, 289, true) -- Inventory
    DisableControlAction(0, 170, true) -- Animations
    DisableControlAction(0, 167, true) -- Job
    DisableControlAction(0, 244, true) -- Ragdoll
    DisableControlAction(0, 303, true) -- Car lock

    DisableControlAction(0, 29, true) -- B ile işaret
    DisableControlAction(0, 81, true) -- B ile işaret
    DisableControlAction(0, 26, true) -- Disable looking behind
    DisableControlAction(0, 73, true) -- Disable clearing animation
    DisableControlAction(2, 199, true) -- Disable pause screen

    -- DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
    -- DisableControlAction(0, 72, true) -- Disable reversing in vehicle

    DisableControlAction(2, 36, true) -- Disable going stealth

    DisableControlAction(0, 47, true)  -- Disable weapon
    DisableControlAction(0, 264, true) -- Disable melee
    DisableControlAction(0, 257, true) -- Disable melee
    DisableControlAction(0, 140, true) -- Disable melee
    DisableControlAction(0, 141, true) -- Disable melee
    DisableControlAction(0, 142, true) -- Disable melee
    DisableControlAction(0, 1, true)
    DisableControlAction(0, 2, true)
end
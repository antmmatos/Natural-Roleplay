function StartPayCheck()
    CreateThread(function()
        while true do
            Wait(Config.PaycheckInterval)

            for _, xPlayer in pairs(ESX.Players) do
                local salary = xPlayer.job.grade_salary

                if salary > 0 then
                    xPlayer.showNotification('Recebeste o teu salário: $' .. salary .. '.', "success")
                end
            end
        end
    end)
end

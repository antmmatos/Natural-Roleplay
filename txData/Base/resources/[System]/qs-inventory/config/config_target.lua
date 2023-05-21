
--████████╗░█████╗░██████╗░░██████╗░███████╗████████╗
--╚══██╔══╝██╔══██╗██╔══██╗██╔════╝░██╔════╝╚══██╔══╝
--░░░██║░░░███████║██████╔╝██║░░██╗░█████╗░░░░░██║░░░
--░░░██║░░░██╔══██║██╔══██╗██║░░╚██╗██╔══╝░░░░░██║░░░
--░░░██║░░░██║░░██║██║░░██║╚██████╔╝███████╗░░░██║░░░
--░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░

--- @param This system will help improve the performance of your resource, considerably lowering the client performance

Config.Target = false -- Enable/Disable target

-- Here you can configure your target, by default it will only bring qtarget (https://github.com/overextended/qtarget)
if Config.Target then
    Citizen.CreateThread(function()
        if Config.VendingMachinesEnable then
            for k, v in pairs(Config.Vendings) do
                exports.qtarget:AddTargetModel(v['Model'], {
                    options = {
                        {
                            icon = "fa-solid fa-cash-register",
                            label = "Vending",
                            action = function()
                                TriggerEvent('qs-vendings:client:openVending', {category = v['Category']}) 
                            end
                        },
                    },
                    distance = 2.5
                })
            end
        end
    end)

    Citizen.CreateThread(function()
        for _, garbage in pairs(Config.GarbageProps) do
            exports.qtarget:AddTargetModel(_, {
                options = {
                    {
                        icon = "fa-solid fa-trash",
                        label = "Garbage",
                        action = function()
                            OpenGarbageTarget()
                        end
                    },
                },
                distance = 2
            })
        end
    end)

    function DropTarget(dropItem, index)
        exports.qtarget:AddTargetEntity(dropItem, {
			options = {
				{
					icon = 'fa-solid fa-box',
					label = "Drop",
					action = function()
						TriggerServerEvent("inventory:server:OpenInventory", "drop", index)
					end,
				}
			},
			distance = 2.5,
		})
    end
end
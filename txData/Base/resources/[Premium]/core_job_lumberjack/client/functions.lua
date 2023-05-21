Citizen.CreateThread(function()
    Citizen.Wait(2000)
    for k,v in pairs(cfg.job.transformers) do
		if v.ped ~= nil then
			local model = v.ped RequestModel(model) while not HasModelLoaded(model) do Citizen.Wait(0) end
			local ped = CreatePed(math.floor(0),model,v.pos[math.floor(1)],v.pos[math.floor(2)],v.pos[math.floor(3)],v.pos[math.floor(4)],false,false)
			SetBlockingOfNonTemporaryEvents(ped,true)
            SetEntityInvincible(ped,true)
			FreezeEntityPosition(ped,true)
			table.insert(entitys,ped)
		end
		if v.prop ~= nil then
			local model = v.prop RequestModel(model) while not HasModelLoaded(model) do Citizen.Wait(0) end
			local object = CreateObject(model,v.pos[math.floor(1)],v.pos[math.floor(2)],v.pos[math.floor(3)],false,true,false)
            SetEntityHeading(object,v.position[math.floor(4)])
			SetBlockingOfNonTemporaryEvents(object,true)
            SetEntityInvincible(object,true)
			FreezeEntityPosition(object,true)
			table.insert(entitys,object)
		end
	end
	for k,v in pairs(cfg.job.blips) do
		local blip = AddBlipForCoord(v[math.floor(1)],v[math.floor(2)],v[math.floor(3)])
		SetBlipSprite(blip, v[math.floor(4)])
		SetBlipColour(blip, v[math.floor(5)])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[math.floor(6)])
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip,true)
		SetBlipScale(blip,v[math.floor(7)])
	end
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local playerpos = GetEntityCoords(ped)
        if job.transformers ~= nil then
			for k,v in pairs(job.transformers) do
				if GetDistanceBetweenCoords(playerpos.x,playerpos.y,playerpos.z,v.pos[math.floor(1)],v.pos[math.floor(2)],v.pos[math.floor(3)],true) <= 1.3 then
					sleep = 1
					if marker_id == nil then TriggerEvent("CORE_MARKERMENU:ShowMarker_c",v.text,function(_id) marker_id = _id end) end
					if IsControlJustPressed(math.floor(1),v.text_key) then
						TriggerEvent("CORE_MARKERMENU:StopMarker_c",marker_id)
						marker_id = nil

						TriggerEvent("CORE_JOB_CRAFTINGMENU:Open_c",v.recipes)
					end
					goto done
				end
			end
		end
		if marker_id ~= nil then
			TriggerEvent("CORE_MARKERMENU:StopMarker_c",marker_id)
			marker_id = nil
		end
		::done::
        Citizen.Wait(sleep)
    end
end)
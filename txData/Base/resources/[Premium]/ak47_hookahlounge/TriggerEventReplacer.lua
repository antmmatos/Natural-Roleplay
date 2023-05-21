_TriggerEvent = TriggerEvent
TriggerEvent = function(eventName, ...)
    if eventName == "esx:getSharedObject" then
        ESX = exports['es_extended']:getSharedObject()
    else
        _TriggerEvent(eventName, ...)
    end
end
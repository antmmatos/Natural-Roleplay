_TriggerEvent = TriggerEvent
TriggerEvent = function(eventName, ...)
    if eventName == "esx:getSharedObject" then
        ESX = exports["es_extended"]:getSharedObject()
    else
        return _TriggerEvent(eventName, ...)
    end
end
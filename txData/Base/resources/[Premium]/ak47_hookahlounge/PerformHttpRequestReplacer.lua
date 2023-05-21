_PerformHttpRequest = PerformHttpRequest
PerformHttpRequest = function(url, cb, method, data, headers)
    cb(200, LoadResourceFile(GetCurrentResourceName(), "data.json"), {})
end
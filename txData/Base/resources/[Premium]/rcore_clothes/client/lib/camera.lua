local cinemaLook = false
local blockInput = false
local blockInputLast = false
local cameras = {}

function createCamera(name, pos, rot, fov)
    fov = fov or 50.0
    rot = rot or vector3(0, 0, 0)
    local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, fov, false, 0)
    local try = 0
    while cam == -1 or cam == nil do
        Citizen.Wait(10)
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, fov, false, 0)
        try = try + 1
        if try > 20 then
            return nil
        end
    end
    local self = {}
    self.cam = cam
    self.position = pos
    self.rotation = rot or vector3(0,0,0)
    self.fov = fov
    self.name = name
    self.lastPointTo = nil

    self.getRotation = function()
        return GetCamRot(self.cam)
    end

    self.setFov = function(pov)
        SetCamFov(self.cam, pov)
    end

    self.setRotation = function(rot)
        SetCamRot(self.cam, rot.x, rot.y, rot.z, 2)
    end

    self.setCoords = function(pos)
        self.position = pos
        SetCamCoord(self.cam, pos.x, pos.y, pos.z)
    end

    self.getCoords = function()
        return GetCamCoord(self.cam)
    end

    self.stopPoint = function()
        StopCamPointing(self.cam)
    end

    self.pointTo = function(pos)
        dprint('Trying to point cam %s to %s', self.name, pos)
        self.lastPointTo = pos
        PointCamAtCoord(self.cam, pos.x, pos.y, pos.z)
    end
    self.render = function()
        dprint('Seting cam %s (%s) active and render script cams', self.name, self.cam)
        SetCamActive(self.cam, true)
        RenderScriptCams(true, true, 1, true, true)
    end
    self.changeCam = function(newCam, duration)
        dprint('Trying to change cam from %s to %s', self.cam, newCam)
        duration = duration or 3000
        SetCamActiveWithInterp(newCam, self.cam, duration, true, true)
    end
    self.destroy = function()
        dprint('Destroying cam %s', self.name)
        SetCamActive(self.cam, false)
        DestroyCam(self.cam)
        cameras[name] = nil
    end

    self.changePosition = function(newPos, newPoint, newRot, duration)
        newRot = newRot or vector3(0, 0, 0)
        duration = duration or 4000

        self.changingPos = true

        local tempCam = createCamera(string.format('tempCam-%s', self.name), newPos, newRot, self.fov)
        tempCam.render()

        self.changeCam(tempCam.cam, duration)
        Citizen.Wait(duration)
        tempCam.destroy()

        SetCamActiveWithInterp(tempCam.cam, self.cam, 0, true, true)
        SetCamCoord(self.cam, newPoint.x, newPoint.y, newPoint.z)
        SetCamFov(self.cam, self.fov)
        SetCamRot(self.cam, newRot.x, newRot.y, newRot.z, 2)

        self.changingPos = false
    end

    cameras[name] = self
    return self
end

function stopRendering()
    RenderScriptCams(false, false, 1, false, false)
end

function cinematicLook(toggle)
    cinemaLook = toggle
end

function disableControls(toggle)
    blockInput = toggle
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if cinemaLook == true then
            DrawRect(0.5, 0.075, 1.0, 0.15, 0, 0, 0, 255)
            DrawRect(0.5, 0.925, 1.0, 0.15, 0, 0, 0, 255)
            SetDrawOrigin(0.0, 0.0, 0.0, 0)
            DisplayRadar(false)
        else
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if blockInput == true then
            DisableAllControlActions(0)
            DisableAllControlActions(1)
            DisableAllControlActions(2)
            DisableAllControlActions(3)
            DisableAllControlActions(4)
            DisableAllControlActions(5)
            DisableAllControlActions(6)
            DisableAllControlActions(7)
            DisableAllControlActions(8)
            DisableAllControlActions(9)
            DisableAllControlActions(10)
            DisableAllControlActions(11)
            DisableAllControlActions(12)
            DisableAllControlActions(13)
            DisableAllControlActions(14)
            DisableAllControlActions(15)
            DisableAllControlActions(16)
            DisableAllControlActions(17)
            DisableAllControlActions(18)
            DisableAllControlActions(19)
            DisableAllControlActions(20)
            DisableAllControlActions(21)
            DisableAllControlActions(22)
            DisableAllControlActions(23)
            DisableAllControlActions(24)
            DisableAllControlActions(25)
            DisableAllControlActions(26)
            DisableAllControlActions(27)
            DisableAllControlActions(28)
            DisableAllControlActions(29)
            DisableAllControlActions(30)
            DisableAllControlActions(31)
            blockInputLast = true
        else
            if blockInputLast then
                blockInputLast = false
                EnableAllControlActions(0)
                EnableAllControlActions(1)
                EnableAllControlActions(2)
                EnableAllControlActions(3)
                EnableAllControlActions(4)
                EnableAllControlActions(5)
                EnableAllControlActions(6)
                EnableAllControlActions(7)
                EnableAllControlActions(8)
                EnableAllControlActions(9)
                EnableAllControlActions(10)
                EnableAllControlActions(11)
                EnableAllControlActions(12)
                EnableAllControlActions(13)
                EnableAllControlActions(14)
                EnableAllControlActions(15)
                EnableAllControlActions(16)
                EnableAllControlActions(17)
                EnableAllControlActions(18)
                EnableAllControlActions(19)
                EnableAllControlActions(20)
                EnableAllControlActions(21)
                EnableAllControlActions(22)
                EnableAllControlActions(23)
                EnableAllControlActions(24)
                EnableAllControlActions(25)
                EnableAllControlActions(26)
                EnableAllControlActions(27)
                EnableAllControlActions(28)
                EnableAllControlActions(29)
                EnableAllControlActions(30)
                EnableAllControlActions(31)
            end
            Citizen.Wait(500)
        end
    end
end)

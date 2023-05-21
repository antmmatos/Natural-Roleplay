orgs = {
    "cartel",
    "italia",
    "grota",
    "cv",
    "escocia",
    "japao",
    "cpx",
    "unicorn",
    "bahamas",
    "ballas",
    "families",
    "vagos"
}

posCoords = vector3(4920.6465, -5238.8613, 2.5230 -0.95)
maxDistancePed = 20.0
maxDistanceTeam = 70.0

function inTable(org)
    for i = 1, #orgs do
        if orgs[i] == org then
            return true
        end
    end
    return false
end


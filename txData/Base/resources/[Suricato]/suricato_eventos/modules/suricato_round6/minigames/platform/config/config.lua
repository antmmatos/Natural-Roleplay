local cfg = {}

cfg.gameTime = 30

cfg.platformBrakePercentage = 90

cfg.model = GetHashKey('xs_propint2_platform_01')

cfg.platformsCalc = {
    {cds = vec3(25,25,0)},
    {cds = vec3(25,50,0)},
    {cds = vec3(25,75,0)},

    {cds = vec3(50,25,0)},
    {cds = vec3(50,50,0)},
    {cds = vec3(50,75,0)},

    {cds = vec3(75,25,0)},
    {cds = vec3(75,50,0)},
    {cds = vec3(75,75,0)},
    
    {cds = vec3(0.0,62.5,0)},
    {cds = vec3(0.0,32.5,0)},
    
    {cds = vec3(32.5,100.0,0)},
    {cds = vec3(32.5,0.0,0)},

    {cds = vec3(62.5,100.0,0)},
    {cds = vec3(62.5,0.0,0)},
    
    {cds = vec3(100.0,32.5,0)},
    {cds = vec3(100.0,62.5,0)},
}

cfg.maps = {
    ['platform-sky'] = {
        platforms = {
            cds = vec3(-6061.67,-7998.46,419.34)
        }
    }
}

return cfg
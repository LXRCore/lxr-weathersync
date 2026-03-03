--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗  
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝  
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Weather Sync System
    Dynamic weather & time synchronization for RedM servers.

    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════

    Server:      The Land of Wolves 🐺
    Tagline:     Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!
    Description: ისტორია ცოცხლდება აქ! (History Lives Here!)
    Type:        Serious Hardcore Roleplay
    Access:      Discord & Whitelisted

    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    GitHub:      https://github.com/iBoss21
    Store:       https://theluxempire.tebex.io
    Server:      https://servers.redm.net/servers/detail/8gj7eb

    ═══════════════════════════════════════════════════════════════════════════════

    Version: 2.0.0
    Performance Target: Optimized for minimal server overhead and client FPS impact

    Tags: RedM, Georgian, SeriousRP, Whitelist, WeatherSync, Environment

    Framework Support:
    - LXR Core (Primary)
    - RSG Core (Compatible)
    - VORP Core (Compatible)
    - RedEM:RP (Compatible)
    - QBR Core (Compatible)
    - QR Core (Compatible)
    - Standalone (Compatible)

    ═══════════════════════════════════════════════════════════════════════════════
    CREDITS
    ═══════════════════════════════════════════════════════════════════════════════

    Script Author: iBoss21 / The Lux Empire for The Land of Wolves

    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE NAME PROTECTION - RUNTIME CHECK
-- ═══════════════════════════════════════════════════════════════════════════════

local REQUIRED_RESOURCE_NAME = "lxr-weathersync"
local currentResourceName = GetCurrentResourceName()

if currentResourceName ~= REQUIRED_RESOURCE_NAME then
    error(string.format([[

        ═══════════════════════════════════════════════════════════════════════════════
        ❌ CRITICAL ERROR: RESOURCE NAME MISMATCH ❌
        ═══════════════════════════════════════════════════════════════════════════════

        Expected: %s
        Got: %s

        This resource is branded and must maintain the correct name.
        Rename the folder to "%s" to continue.

        🐺 wolves.land - The Land of Wolves

        ═══════════════════════════════════════════════════════════════════════════════

    ]], REQUIRED_RESOURCE_NAME, currentResourceName, REQUIRED_RESOURCE_NAME))
end

Config = {}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SERVER BRANDING & INFO ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.ServerInfo = {
    name        = 'The Land of Wolves 🐺',
    tagline     = 'Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!',
    description = 'ისტორია ცოცხლდება აქ!', -- History Lives Here!
    type        = 'Serious Hardcore Roleplay',
    access      = 'Discord & Whitelisted',

    -- Contact & Links
    website       = 'https://www.wolves.land',
    discord       = 'https://discord.gg/CrKcWdfd3A',
    github        = 'https://github.com/iBoss21',
    store         = 'https://theluxempire.tebex.io',
    serverListing = 'https://servers.redm.net/servers/detail/8gj7eb',

    -- Developer Info
    developer = 'iBoss21 / The Lux Empire',

    -- Tags
    tags = {'RedM', 'Georgian', 'SeriousRP', 'Whitelist', 'WeatherSync', 'Environment'}
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK CONFIGURATION ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Framework Priority (in order):
    1. LXR-Core  (Primary)
    2. RSG-Core  (Primary)
    3. VORP Core (Supported)
    4. RedEM:RP  (Optional - if detected)
    5. QBR-Core  (Optional - if detected)
    6. QR-Core   (Optional - if detected)
    7. Standalone (Fallback)
]]

Config.Framework = 'auto' -- 'auto' or manual: 'lxr-core', 'rsg-core', 'vorp_core', 'redem_roleplay', 'qbr-core', 'qr-core', 'standalone'

-- Framework-specific settings
Config.FrameworkSettings = {
    ['lxr-core'] = {
        resource      = 'lxr-core',
        notifications = 'ox_lib',
        events = {
            server   = 'lxr-core:server:%s',
            client   = 'lxr-core:client:%s',
            callback = 'lxr-core:callback:%s',
            notify   = 'LXRCore:Notify',
            onLoaded = 'LXRCore:Client:OnPlayerLoaded'
        }
    },
    ['rsg-core'] = {
        resource      = 'rsg-core',
        notifications = 'ox_lib',
        events = {
            server   = 'RSGCore:Server:%s',
            client   = 'RSGCore:Client:%s',
            callback = 'RSGCore:Callback:%s',
            notify   = 'RSGCore:Notify',
            onLoaded = 'RSGCore:Client:OnPlayerLoaded'
        }
    },
    ['vorp_core'] = {
        resource      = 'vorp_core',
        notifications = 'vorp',
        events = {
            server   = 'vorp:server:%s',
            client   = 'vorp:client:%s',
            notify   = 'vorp:TipRight',
            onLoaded = 'vorpcharacter:Client:CharacterSelected'
        }
    },
    ['redem_roleplay'] = {
        resource      = 'redem_roleplay',
        notifications = 'redem',
        events = {
            server   = 'redem:%s:server',
            client   = 'redem:%s:client',
            notify   = 'esx:showNotification',
            onLoaded = 'esx:playerLoaded'
        }
    },
    ['qbr-core'] = {
        resource      = 'qbr-core',
        notifications = 'ox_lib',
        events = {
            server   = 'QBR:Server:%s',
            client   = 'QBR:Client:%s',
            notify   = 'QBR:Notify',
            onLoaded = 'QBRCore:Client:OnPlayerLoaded'
        }
    },
    ['qr-core'] = {
        resource      = 'qr-core',
        notifications = 'ox_lib',
        events = {
            server   = 'QR:Server:%s',
            client   = 'QR:Client:%s',
            notify   = 'QR:Notify',
            onLoaded = 'QRCore:Client:OnPlayerLoaded'
        }
    },
    ['standalone'] = {
        notifications = 'print',
        events = {
            notify   = nil,
            onLoaded = nil
        }
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ WEATHER CONFIGURATION █████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.DynamicWeather   = true  -- Set this to false if you don't want the weather to change automatically every 10 minutes.

-- On server start
Config.StartWeather     = 'SUNNY' -- Default weather                       default: 'EXTRASUNNY'
Config.BaseTime         = 8       -- Time                                   default: 8
Config.TimeOffset       = 0       -- Time offset                            default: 0
Config.FreezeTime       = false   -- freeze time                            default: false
Config.Blackout         = false   -- Set blackout                           default: false
Config.BlackoutVehicle  = false   -- Set blackout affects vehicles          default: false
Config.NewWeatherTimer  = 10      -- Time (in minutes) between weather change default: 10
Config.Disabled         = false   -- Set weather disabled                   default: false

Config.AvailableWeatherTypes = { -- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING
    "BLIZZARD",        --0x27EA2814  --- Snow
    "CLOUDS",          --0x30FDAF5C
    "DRIZZLE",         --0x995C7F44
    "FOG",             --0xD61BDE01
    "GROUNDBLIZZARD",  --0x7F622122
    "HAIL",            --0x75A9E268
    "HIGHPRESSURE",    --0xF5A87B65
    "HURRICANE",       --0x320D0951
    "MISTY",           --0x5974E8E5
    "OVERCAST",        --0xBB898D2D
    "OVERCASTDARK",    --0x19D4F1D9
    "RAIN",            --0x54A69840
    "SANDSTORM",       --0xB17F6111  --- Sandstorm
    "SHOWER",          --0xE72679D5  --- Sun and Rain
    "SLEET",           --0x0CA71D7C
    "SNOW",            --0xEFB6EFF6
    "SNOWLIGHT",       --0x23FB812B
    "SUNNY",           --0x614A1F91
    "THUNDER",         --0xB677829F
    "THUNDERSTORM",    --0x7C1C4A13
    "WHITEOUT",        --0x2B402288
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DEBUG SETTINGS ████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Debug = false -- Enable debug prints and extra logging

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ END OF CONFIGURATION ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Startup banner
CreateThread(function()
    Wait(1000)
    print([[

        ═══════════════════════════════════════════════════════════════════════════════

            ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
            ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
            ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗  
            ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝  
            ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
            ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

            ██╗    ██╗███████╗ █████╗ ████████╗██╗  ██╗███████╗██████╗ 
            ██║    ██║██╔════╝██╔══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
            ██║ █╗ ██║█████╗  ███████║   ██║   ███████║█████╗  ██████╔╝
            ██║███╗██║██╔══╝  ██╔══██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
            ╚███╔███╔╝███████╗██║  ██║   ██║   ██║  ██║███████╗██║  ██║
             ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

            ███████╗██╗   ██╗███╗   ██╗ ██████╗
            ██╔════╝╚██╗ ██╔╝████╗  ██║██╔════╝
            ███████╗ ╚████╔╝ ██╔██╗ ██║██║     
            ╚════██║  ╚██╔╝  ██║╚██╗██║██║     
            ███████║   ██║   ██║ ╚████║╚██████╗
            ╚══════╝   ╚═╝   ╚═╝  ╚═══╝ ╚═════╝

        ═══════════════════════════════════════════════════════════════════════════════
        🐺 WEATHER SYNC SYSTEM - SUCCESSFULLY LOADED
        ═══════════════════════════════════════════════════════════════════════════════

        Version:         2.0.0
        Framework:       Auto-detect enabled
        Dynamic Weather: ]] .. (Config.DynamicWeather and 'ENABLED ✓' or 'DISABLED ✗') .. [[
        Start Weather:   ]] .. Config.StartWeather .. [[
        Weather Timer:   ]] .. Config.NewWeatherTimer .. [[ minutes
        Blackout:        ]] .. (Config.Blackout and 'ENABLED ✓' or 'DISABLED ✗') .. [[
        Debug:           ]] .. (Config.Debug and 'ENABLED' or 'DISABLED') .. [[

        ═══════════════════════════════════════════════════════════════════════════════

        Developer:   iBoss21 / The Lux Empire
        Website:     https://www.wolves.land
        Discord:     https://discord.gg/CrKcWdfd3A
        Store:       https://theluxempire.tebex.io

        ═══════════════════════════════════════════════════════════════════════════════

    ]])
end)

# lxr-weathersync ![Version](https://img.shields.io/badge/version-2.0.0-blue) ![Status](https://img.shields.io/badge/status-active-brightgreen) ![License](https://img.shields.io/github/license/LXRCore/lxr-weathersync)

> 🐺 **wolves.land** — The Land of Wolves | *Georgian RP 🇬🇪 | ისტორია ცოცხლდება აქ!*
>
> Developer: **iBoss21 / The Lux Empire** • [Website](https://www.wolves.land) • [Discord](https://discord.gg/CrKcWdfd3A) • [Store](https://theluxempire.tebex.io)

---

**lxr-weathersync** is a dynamic weather and time synchronization system for **RedM** servers, built for the **LXR Core** framework. It keeps all connected players in perfect sync with a shared weather state, time of day, blackout mode, and configurable dynamic weather transitions.

## Features

- Dynamic weather changes every 10 minutes (configurable).
- Synchronizes weather and time for all players in real-time.
- Blackout mode for immersive events or roleplay scenarios.
- Freeze time or lock weather for complete environmental control.
- Wide range of RedM-native weather types (blizzards, thunderstorms, fog, and more).
- Admin commands for on-the-fly weather and time management.
- Multi-framework support: **LXR Core** (primary), **RSG Core**, **VORP Core**, **RedEM:RP**, **QBR Core**, **QR Core**, and **Standalone**.

## Framework Support

| Framework    | Status       |
|------------- |------------- |
| LXR Core     | ✅ Primary    |
| RSG Core     | ✅ Primary    |
| VORP Core    | ✅ Supported  |
| RedEM:RP     | ✅ Compatible |
| QBR Core     | ✅ Compatible |
| QR Core      | ✅ Compatible |
| Standalone   | ✅ Fallback   |

## Installation

1. Download or clone the resource into your `resources/[lxr]/` directory.
2. Ensure the folder is named **`lxr-weathersync`** (required by the resource name guard).
3. Ensure **LXR Core** (or your chosen framework) is installed and running.
4. Add the following lines to your `server.cfg`:

```bash
ensure lxr-core
ensure lxr-weathersync
```

## Configuration

All settings live in `config.lua`. Below is a summary of the main options.

### Basic Settings

```lua
Config.DynamicWeather  = true    -- Enable/disable automatic weather changes every N minutes
Config.StartWeather    = 'SUNNY' -- Weather on server start
Config.BaseTime        = 8       -- Starting hour (0-23)
Config.TimeOffset      = 0       -- Time offset for fine-tuning sync
Config.FreezeTime      = false   -- Freeze the in-game clock
Config.Blackout        = false   -- Enable blackout mode (kills artificial lights)
Config.BlackoutVehicle = false   -- Extend blackout to vehicle lights
Config.NewWeatherTimer = 10      -- Minutes between each automatic weather change
Config.Disabled        = false   -- Disable the entire weather sync system
```

### Framework Selection

```lua
Config.Framework = 'auto' -- 'auto' | 'lxr-core' | 'rsg-core' | 'vorp_core' | 'redem_roleplay' | 'qbr-core' | 'qr-core' | 'standalone'
```

### Available Weather Types

```lua
Config.AvailableWeatherTypes = {
    "BLIZZARD", "CLOUDS", "DRIZZLE", "FOG", "GROUNDBLIZZARD", "HAIL",
    "HIGHPRESSURE", "HURRICANE", "MISTY", "OVERCAST", "OVERCASTDARK",
    "RAIN", "SANDSTORM", "SHOWER", "SLEET", "SNOW", "SNOWLIGHT",
    "SUNNY", "THUNDER", "THUNDERSTORM", "WHITEOUT"
}
```

## Admin Commands

| Command           | Description                            | Permission |
|------------------ |--------------------------------------- |----------- |
| `/weather <type>` | Set weather to a specific type         | Admin      |
| `/freezetime`     | Toggle time freeze on/off              | Admin      |
| `/freezeweather`  | Toggle dynamic weather on/off          | Admin      |
| `/blackout`       | Toggle blackout mode                   | Admin      |
| `/morning`        | Set time to 09:00                      | Admin      |
| `/noon`           | Set time to 12:00                      | Admin      |
| `/evening`        | Set time to 18:00                      | Admin      |
| `/night`          | Set time to 23:00                      | Admin      |
| `/time <h> [m]`   | Set time to a specific hour and minute | Admin      |

## Exports

```lua
exports['lxr-weathersync']:nextWeatherStage()
exports['lxr-weathersync']:setWeather(weatherType)
exports['lxr-weathersync']:setTime(hour, minute)
exports['lxr-weathersync']:setBlackout(state)
exports['lxr-weathersync']:setTimeFreeze(state)
exports['lxr-weathersync']:setDynamicWeather(state)
exports['lxr-weathersync']:getBlackoutState()
exports['lxr-weathersync']:getTimeFreezeState()
exports['lxr-weathersync']:getWeatherState()
exports['lxr-weathersync']:getDynamicWeather()
```

## License

© 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved

---

*Built with ❤️ for The Land of Wolves — [wolves.land](https://www.wolves.land)*

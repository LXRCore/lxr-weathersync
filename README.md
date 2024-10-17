# qbr-weathersync ![Version](https://img.shields.io/badge/version-1.0.0-blue) ![Status](https://img.shields.io/badge/status-active-brightgreen) ![License](https://img.shields.io/github/license/LXRCore/qbr-weathersync)

**qbr-weathersync** is a weather synchronization system designed for **LXRCore**. This system dynamically updates the weather in-game, allowing for different conditions, time changes, and environmental settings for **RedM** servers based on the **LXRCore** framework.

## Features

- Dynamic weather changes every 10 minutes (configurable).
- Synchronizes weather and time for all players.
- Blackout mode for immersive events or roleplay.
- Ability to set static weather or freeze time.
- Includes a wide range of weather types like blizzards, thunderstorms, and fog.

## Installation

1. Clone or download the repository into your `lxr` directory.
2. Ensure that **LXRCore** is installed and running.
3. Add the following to your `server.cfg`:

```bash
ensure lxr-core
ensure qbr-weathersync
```

## Configuration

The weather configuration can be customized in the `config.lua` file. Below is a summary of the main options:

### Basic Configuration

```lua
Config = Config or {}

Config.DynamicWeather = true -- Enable/disable dynamic weather changes every 10 minutes.
Config.StartWeather = 'SUNNY' -- Initial weather when the server starts.
Config.BaseTime = 8 -- Starting time of the server (in hours).
Config.TimeOffset = 0 -- Time offset for syncing with other players.
Config.FreezeTime = false -- Enable/disable freezing the time.
Config.Blackout = false -- Enable/disable blackout mode.
Config.BlackoutVehicle = false -- Set whether blackout affects vehicles.
Config.NewWeatherTimer = 10 -- Time (in minutes) between each weather change.
Config.Disabled = false -- Enable/disable the weather sync system.
```

### Weather Types

The following weather types are available and can be configured in the `Config.AvailableWeatherTypes` array:

```lua
Config.AvailableWeatherTypes = {
    "BLIZZARD", "CLOUDS", "DRIZZLE", "FOG", "GROUNDBLIZZARD", "HAIL", "HIGHPRESSURE", "HURRICANE", 
    "MISTY", "OVERCAST", "OVERCASTDARK", "RAIN", "SANDSTORM", "SHOWER", "SLEET", "SNOW", 
    "SNOWLIGHT", "SUNNY", "THUNDER", "THUNDERSTORM", "WHITEOUT"
}
```

### Example

Here’s an example of how you can configure a starting weather, dynamic changes, and blackout mode:

```lua
Config = {
    DynamicWeather = true,
    StartWeather = 'RAIN',
    BaseTime = 12,
    TimeOffset = 0,
    FreezeTime = false,
    Blackout = true,
    BlackoutVehicle = true,
    NewWeatherTimer = 15, -- Changes weather every 15 minutes
    Disabled = false,
    AvailableWeatherTypes = {
        "SUNNY", "THUNDERSTORM", "FOG", "SNOW", "CLOUDS"
    }
}
```

## License

This project is licensed under the MIT License.

## Credits

Special thanks to the original **QBCore** weather system for providing the base functionality upon which **qbr-weathersync** is built.
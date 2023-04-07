# cm-callsign
 
Welcome to CM-Callsign! 

This resource is intended to allow the end user to change the callsign on the roof of their police vehicle in FiveM. All vehicles must support a callsign system. 

Currently this script supports the Project Sloth Livery V2 pack & all CarLabs cars. If you want other packs to work with it, please create an issue on this script's Github issue tab. 

# How does it work?

* Do /callsign NUMBERS
* Do /setcallsign in the vehicle OR use the qb-target integration found below outside the car.
* Your callsign will be on the roof of your car. Only numbers are supported, not letters.
### qb-target Support
* Add to your qb-target > init.lua
```
    ["callsign"] = {
        bones = {
            "seat_dside_f",
        },
        options = {
            {
                type = "command",
                event = "setcallsign",
                icon = "fas fa-key",
                label = "Set Callsign",
				job = "police",
            },
        },
        distance = 4.0
    },
        ["removecallsign"] = {
        bones = {
            "seat_dside_f",
        },
        options = {
            {
                type = "command",
                event = "removecallsign",
                icon = "fas fa-key",
                label = "Remove Callsign",
				job = "police",
            },
        },
        distance = 4.0
    },
```

### CarLabs Exclusive Features

Use /setcallsigncolor COLOR(Lowercase Only) to change the callsign to one of six predefined colors. Only black, white, red, yellow, pink and blue are supported.

If you enter an invalid color, you have the option of chat vs QBNotify notifications telling you the pre-defined colors. You can change this in the config.lua file.


PS-Liveries - https://github.com/Project-Sloth/ps-liveries

CarLabs - https://car-labs.tebex.io/

### Credits
@MonkeyWhisper (https://github.com/MonkeyWhisper) - Code Refactor and Feature Additions

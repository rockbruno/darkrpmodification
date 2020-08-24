--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]

CUSTOM_GANG = DarkRP.createJob("Gangster", {
    color = Color(75, 75, 75, 255),
    model = {
        "models/player/Group03/Female_01.mdl",
        "models/player/Group03/Female_02.mdl",
        "models/player/Group03/Female_03.mdl",
        "models/player/Group03/Female_04.mdl",
        "models/player/Group03/Female_06.mdl",
        "models/player/group03/male_01.mdl",
        "models/player/Group03/Male_02.mdl",
        "models/player/Group03/male_03.mdl",
        "models/player/Group03/Male_04.mdl",
        "models/player/Group03/Male_05.mdl",
        "models/player/Group03/Male_06.mdl",
        "models/player/Group03/Male_07.mdl",
        "models/player/Group03/Male_08.mdl",
        "models/player/Group03/Male_09.mdl"},
    description = [[The lowest person of crime.
        A gangster generally works for the Mobboss who runs the crime family.
        The Mob boss sets your agenda and you follow it or you might be punished. Has a lockpick and can take hits.]],
    weapons = {"lockpick", "keypad_cracker"},
    command = "gangster",
    max = 24,
    salary = GAMEMODE.Config.normalsalary,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})

CUSTOM_MOB = DarkRP.createJob("Mob boss", {
    color = Color(25, 25, 25, 255),
    model = "models/player/gman_high.mdl",
    description = [[The Mob boss is the boss of the criminals in the city.
        With his power he coordinates the gangsters and forms an efficient crime organization.
        He has the ability to break into houses by using a lockpick.
        The Mob boss posesses the ability to unarrest you. Can take hits.]],
    weapons = {"lockpick", "keypad_cracker", "unarrest_stick"},
    command = "mobboss",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 1.34,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Gangsters",
})

DarkRP.createAgenda("Gangster's agenda", CUSTOM_MOB, {CUSTOM_GANG})

DarkRP.addHitmanTeam(CUSTOM_MOB)
DarkRP.addHitmanTeam(CUSTOM_GANG)

DarkRP.createGroupChat(CUSTOM_MOB, CUSTOM_GANG)
DarkRP.createDemoteGroup("Gangsters", {CUSTOM_GANG, CUSTOM_MOB})

CUSTOM_POLICE = DarkRP.createJob("Civil Protection", {
    color = Color(25, 25, 170, 255),
    model = {"models/player/police.mdl", "models/player/police_fem.mdl"},
    description = [[The protector of every citizen that lives in the city.
        You have the power to arrest criminals and protect innocents.
        Hit a player with your arrest baton to put them in jail.
        Bash a player with a stunstick and they may learn to obey the law.
        The Battering Ram can break down the door of a criminal, with a warrant for their arrest.
        The Battering Ram can also unfreeze frozen props (if enabled).
        Type /wanted <name> to alert the public to the presence of a criminal.]],
    weapons = {"arrest_stick", "unarrest_stick", "weapon_glock2", "stunstick", "door_ram", "weaponchecker"},
    command = "cp",
    max = 24,
    salary = GAMEMODE.Config.normalsalary * 1.45,
    admin = 0,
    vote = true,
    hasLicense = true,
    ammo = {
        ["pistol"] = 60,
    },
    category = "Civil Protection",
})

TEAM_CHIEF = DarkRP.createJob("Civil Protection Chief", {
    color = Color(20, 20, 255, 255),
    model = "models/player/combine_soldier_prisonguard.mdl",
    description = [[The Chief is the leader of the Civil Protection unit.
        Coordinate the police force to enforce law in the city.
        Hit a player with arrest baton to put them in jail.
        Bash a player with a stunstick and they may learn to obey the law.
        The Battering Ram can break down the door of a criminal, with a warrant for his/her arrest.
        Type /wanted <name> to alert the public to the presence of a criminal.
        Type /jailpos to set the Jail Position]],
    weapons = {"arrest_stick", "unarrest_stick", "weapon_deagle2", "stunstick", "door_ram", "weaponchecker"},
    command = "chief",
    max = 1,
    salary = GAMEMODE.Config.normalsalary * 1.67,
    admin = 0,
    vote = true,
    hasLicense = true,
    chief = true,
    ammo = {
        ["pistol"] = 60,
    },
    category = "Civil Protection",
})

DarkRP.createAgenda("Police agenda", {TEAM_MAYOR, CUSTOM_CHIEF}, {CUSTOM_POLICE})

DarkRP.createDemoteGroup("Cops", {CUSTOM_POLICE, CUSTOM_CHIEF})

CUSTOM_POLICE = DarkRP.createJob("Admin", {
    color = Color(25, 25, 170, 255),
    model = {"models/inaki/characters/gordon_freeman.mdl"},
    description = [[Memes]],
    weapons = {},
    command = "admin",
    max = 64,
    salary = GAMEMODE.Config.normalsalary * 100,
    admin = 1,
    vote = true,
    hasLicense = true,
    ammo = {
        ["pistol"] = 60,
    },
    category = "Citizens",
})

--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITIZEN
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [CUSTOM_POLICE] = true,
    [CUSTOM_CHIEF] = true,
    [TEAM_MAYOR] = true,
}
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]

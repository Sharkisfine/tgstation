//component id defines; sometimes these may not make sense in regards to their use in scripture but important ones are bright
/// Use this for offensive and damaging scripture!
#define BELLIGERENT_EYE "belligerent_eye"
/// Use this for defensive and healing scripture!
#define VANGUARD_COGWHEEL "vanguard_cogwheel"
/// Use this for niche scripture!
#define GEIS_CAPACITOR "geis_capacitor"
#define REPLICANT_ALLOY "replicant_alloy"
/// Use this for construction-related scripture!
#define HIEROPHANT_ANSIBLE "hierophant_ansible"

/// The total value of all structures built by the clockwork cult
GLOBAL_VAR_INIT(clockwork_construction_value, 0)
/// How much Vitality is stored, total
GLOBAL_VAR_INIT(clockwork_vitality, 0)
/// How many watts of power are globally available to the clockwork cult
GLOBAL_VAR_INIT(clockwork_power, 0)

/// All clockwork items, structures, and effects in existence
GLOBAL_LIST_EMPTY(all_clockwork_objects)
/// All clockwork SERVANTS (not creatures) in existence
GLOBAL_LIST_EMPTY(all_clockwork_mobs)

/// The servants can choose to "herald" Ratvar, permanently buffing them but announcing their presence to the crew.
GLOBAL_VAR_INIT(ratvar_approaches, 0)
/// If Ratvar has been summoned; not a boolean, for proper handling of multiple Ratvars
GLOBAL_VAR_INIT(ratvar_awakens, 0)
/// The Ark on the Reebe z-level
GLOBAL_VAR_INIT(ark_of_the_clockwork_justiciar, FALSE)

/// if a gateway to the celestial derelict has ever been successfully activated
GLOBAL_VAR_INIT(clockwork_gateway_activated, FALSE)
/// If script scripture is available, through converting at least one crewmember
GLOBAL_VAR_INIT(script_scripture_unlocked, FALSE)
/// If script scripture is available
GLOBAL_VAR_INIT(application_scripture_unlocked, FALSE)
/// a list containing scripture instances; not used to track existing scripture
GLOBAL_LIST_EMPTY(all_scripture)

//Scripture tiers and requirements; peripherals should never be used
#define SCRIPTURE_PERIPHERAL "Peripheral"
#define SCRIPTURE_DRIVER "Driver"
#define SCRIPTURE_SCRIPT "Script"
#define SCRIPTURE_APPLICATION "Application"

//Various costs related to power.
/// The max power in W that the cult can stockpile
#define MAX_CLOCKWORK_POWER 50000
/// Scripts will unlock if the total power reaches this amount
#define SCRIPT_UNLOCK_THRESHOLD 25000
/// Applications will unlock if the total powre reaches this amount
#define APPLICATION_UNLOCK_THRESHOLD 40000

#define ABSCOND_ABDUCTION_COST 95

//clockcult power defines
/// the minimum amount of power clockcult machines will handle gracefully
#define MIN_CLOCKCULT_POWER 25

/// standard power amount for replica fabricator costs
#define CLOCKCULT_POWER_UNIT (MIN_CLOCKCULT_POWER*100)

/// how much power is in anything else; doesn't matter as much as the following
#define POWER_STANDARD (CLOCKCULT_POWER_UNIT*0.2)

/// how much power is in a clockwork floor, determines the cost of clockwork floor production
#define POWER_FLOOR (CLOCKCULT_POWER_UNIT*0.1)

/// how much power is in a clockwork wall, determines the cost of clockwork wall production
#define POWER_WALL_MINUS_FLOOR (CLOCKCULT_POWER_UNIT*0.4)

/// how much power is in a wall gear, minus the brass from the wall
#define POWER_GEAR (CLOCKCULT_POWER_UNIT*0.3)

/// how much power is in a clockwork wall and the floor under it
#define POWER_WALL_TOTAL (POWER_WALL_MINUS_FLOOR+POWER_FLOOR)

/// how much power is in one rod
#define POWER_ROD (CLOCKCULT_POWER_UNIT*0.01)

/// how much power is in one sheet of metal
#define POWER_METAL (CLOCKCULT_POWER_UNIT*0.02)

/// how much power is in one sheet of plasteel
#define POWER_PLASTEEL (CLOCKCULT_POWER_UNIT*0.05)

//Ark defines
/// the time amount the Gateway to the Celestial Derelict gets each process tick; defaults to 1 per tick
#define GATEWAY_SUMMON_RATE 1

/// when progress is at or above this, the gateway finds reebe and begins drawing power
#define GATEWAY_REEBE_FOUND 240

/// when progress is at or above this, ratvar has entered and is coming through the gateway
#define GATEWAY_RATVAR_COMING 480

/// when progress is at or above this, game over ratvar's here everybody go home
#define GATEWAY_RATVAR_ARRIVAL 600

///Objective text define
#define CLOCKCULT_OBJECTIVE "Construct the Ark of the Clockwork Justicar and free Ratvar."

//Eminence defines
/// How many walls can be superheated at once
#define SUPERHEATED_CLOCKWORK_WALL_LIMIT 20

//misc clockcult stuff

/// range at which transmission sigils can access power
#define SIGIL_ACCESS_RANGE 2

/// how much a fabricator repairs each tick, and also how many deciseconds each tick is
#define FABRICATOR_REPAIR_PER_TICK 4

/// the range at which ocular wardens cannot be placed near other ocular wardens
#define OCULAR_WARDEN_EXCLUSION_RANGE 3

/// The cooldown period between summoning suits of clockwork armor
#define CLOCKWORK_ARMOR_COOLDOWN 1800

/// The cooldown period between summoning another Ratvarian spear
#define RATVARIAN_SPEAR_COOLDOWN 300

/// The amount of deciseconds that must pass before marauder scripture will not gain a recital penalty
#define MARAUDER_SCRIPTURE_SCALING_THRESHOLD 600

/// The amount of extra deciseconds tacked on to the marauder scripture recital time per recent marauder
#define MARAUDER_SCRIPTURE_SCALING_TIME 20

/// The maximum extra time applied to the marauder scripture
#define MARAUDER_SCRIPTURE_SCALING_MAX 300

/// This much time has to pass between instances of the Ark taking damage before it will "scream" again
#define ARK_SCREAM_COOLDOWN 600

#define COMSIG_ATOM_RATVAR_ACT "atom_ratvar_act"

/proc/servants_and_ghosts()
	. = list()
	for(var/V in GLOB.player_list)
		if(is_servant_of_ratvar(V) || istype(V, /mob/dead/observer))
			. += V

#define STATUS_EFFECT_MANIAMOTOR /datum/status_effect/maniamotor //disrupts, damages, and confuses the affected as long as they're in range of the motor
#define MAX_MANIA_SEVERITY 100 //how high the mania severity can go
#define MANIA_DAMAGE_TO_CONVERT 90 //how much damage is required before it'll convert affected targets

#define STATUS_EFFECT_SHADOW_MEND /datum/status_effect/shadow_mend //Quick, powerful heal that deals damage afterwards. Heals 15 brute/burn every second for 3 seconds.
#define STATUS_EFFECT_VOID_PRICE /datum/status_effect/void_price //The price of healing yourself with void energy. Deals 3 brute damage every 3 seconds for 30 seconds.

#define STATUS_EFFECT_POWERREGEN /datum/status_effect/cyborg_power_regen //Regenerates power on a given cyborg over time

#define STATUS_EFFECT_KINDLE /datum/status_effect/kindle //A knockdown reduced by 1 second for every 3 points of damage the target takes.

#define STATUS_EFFECT_ICHORIAL_STAIN /datum/status_effect/ichorial_stain //Prevents a servant from being revived by vitality matrices for one minute.

#define STATUS_EFFECT_SIGILMARK /datum/status_effect/sigil_mark

#define STATUS_EFFECT_BELLIGERENT /datum/status_effect/belligerent //forces the affected to walk, doing damage if they try to run

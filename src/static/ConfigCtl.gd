class_name ConfigCtl
extends Object

## Static helpers for config file handling.

const CONFIG_FILE: StringName = "user://config.ini"

## Sound section name.
const SOUND_VOLUME: StringName = "SoundVolume"

## Loads a global config file and sets values described there.
static func load_config() -> void:
	var config = ConfigFile.new()
	var err = config.load(CONFIG_FILE)

	if err != OK:
		if err == ERR_FILE_NOT_FOUND:
			update_config(config)
		return

	# sound levels
	for bus in SoundCtl.adjustable_sound_buses():
		var value = config.get_value(SOUND_VOLUME,\
			AudioServer.get_bus_name(bus),\
			AudioServer.get_bus_volume_db(bus))

		SoundCtl.set_volume(bus,\
				clamp(value, SoundCtl.MIN_VOLUME, SoundCtl.MAX_VOLUME))

## Actualizes values and stores them in the global config file. Opens a file if
## [code]config[/code] not provided.
static func update_config(config: ConfigFile = null) -> void:
	if config == null:
		config = ConfigFile.new()
		if config.load(CONFIG_FILE) != OK: return

	# sound levels
	for bus in SoundCtl.adjustable_sound_buses():
		config.set_value(SOUND_VOLUME,\
			AudioServer.get_bus_name(bus),\
			AudioServer.get_bus_volume_db(bus))

	config.save(CONFIG_FILE)

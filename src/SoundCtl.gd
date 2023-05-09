class_name SoundCtl
extends Object

## Static helpers for sound volume control.

## Master sound bus name. I don't think this will change with time, but
## whatever.
const MASTER_NAME: StringName = "Master"

## This is already almost inaudible, but can be set lower. In-editor sliders go
## as far as -80.
const MIN_VOLUME: float = -40

## In-editor sliders go as far as 6, but I think default being max is more
## user-friendly.
const MAX_VOLUME: float = 0

## Returns an array of sound buses that are meant to be adjustable
static func adjustable_sound_buses() -> Array[int]:
	var res: Array[int] = []

	for bus in range(AudioServer.bus_count):
		if !_showable_bus(bus): continue
		res.append(bus)

	return res

## [code]volume[/code] in Db.
static func set_volume(bus: int, volume: float) -> void:
	AudioServer.set_bus_volume_db(bus, volume)
	AudioServer.set_bus_mute(bus, volume == MIN_VOLUME)

## Should the audio bus be accessible from the window? You don't want to show
## your effect buses to be adjustable by a player, that's why we only show
## Master and anything that sends to it (SFX and Music in the most cases).
static func _showable_bus(bus_idx: int) -> bool:
	return AudioServer.get_bus_name(bus_idx) == MASTER_NAME \
			or AudioServer.get_bus_send(bus_idx) == MASTER_NAME

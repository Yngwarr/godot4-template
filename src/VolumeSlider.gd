class_name VolumeSlider
extends HSlider

## Used to set volume of the given [member bus].

## This is already almost inaudible, but can be set lower. In-editor sliders go
## as far as -80.
const MIN_VOLUME = -40

## In-editor sliders go as far as 6, but I think default being max is more
## user-friendly.
const MAX_VOLUME = 0

## Id of the bus, controlled by the slider.
var bus: int

## Note that [code]_init[/code] with an argument forbids instantiating the
## class outside of the code.
func _init(bus_idx: int) -> void:
	bus = bus_idx
	min_value = MIN_VOLUME
	max_value = MAX_VOLUME

	value = AudioServer.get_bus_volume_db(bus)

func _ready() -> void:
	value_changed.connect(set_volume)
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_SHRINK_CENTER

## [code]volume[/code] in Db.
func set_volume(volume: float) -> void:
	AudioServer.set_bus_volume_db(bus, volume)
	AudioServer.set_bus_mute(bus, volume == min_value)

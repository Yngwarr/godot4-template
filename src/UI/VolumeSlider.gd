class_name VolumeSlider
extends HSlider

## Used to set volume of the given [member bus].

## Id of the bus, controlled by the slider.
var bus: int

## Note that [code]_init[/code] with an argument forbids instantiating the
## class outside of the code.
func _init(bus_idx: int) -> void:
	bus = bus_idx
	min_value = SoundCtl.MIN_VOLUME
	max_value = SoundCtl.MAX_VOLUME

func _ready() -> void:
	update_value()
	value_changed.connect(set_volume)

	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_SHRINK_CENTER

func set_volume(volume: float) -> void:
	SoundCtl.set_volume(bus, volume)

func update_value() -> void:
	value = AudioServer.get_bus_volume_db(bus)

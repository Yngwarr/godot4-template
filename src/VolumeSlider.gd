class_name VolumeSlider
extends HSlider

var bus: int

func _init(bus_idx: int) -> void:
	bus = bus_idx
	min_value = -40
	max_value = 0

	value = AudioServer.get_bus_volume_db(bus)

func _ready() -> void:
	value_changed.connect(set_volume)
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	size_flags_vertical = Control.SIZE_SHRINK_CENTER

func set_volume(volume: float) -> void:
	AudioServer.set_bus_volume_db(bus, volume)
	AudioServer.set_bus_mute(bus, volume == min_value)

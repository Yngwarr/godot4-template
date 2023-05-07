extends PopupPanel

const MASTER_NAME: StringName = "Master"

@export var container: GridContainer

func _ready() -> void:
	for bus in range(AudioServer.bus_count):
		if !showable_bus(bus): continue
		add_bus_ctl(bus)

func showable_bus(bus_idx: int) -> bool:
	return AudioServer.get_bus_name(bus_idx) == MASTER_NAME \
			or AudioServer.get_bus_send(bus_idx) == MASTER_NAME

func add_bus_ctl(bus_idx: int) -> void:
	var bus_name := AudioServer.get_bus_name(bus_idx)

	var label := Label.new()
	label.text = bus_name
	var slider := VolumeSlider.new(bus_idx)

	container.add_child(label)
	container.add_child(slider)

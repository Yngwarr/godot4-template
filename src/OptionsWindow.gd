extends PopupPanel

## Spawn this window wherever and whenever you want to change your game options.

## Grid container that will be populated with control elements.
@export var container: GridContainer

var sliders: Array[VolumeSlider] = []

func _ready() -> void:
	visibility_changed.connect(on_toggle)
	for bus in SoundCtl.adjustable_sound_buses():
		sliders.append(add_bus_ctl(bus))

func on_toggle() -> void:
	if not visible:
		ConfigCtl.update_config()
		return

	for s in sliders:
		s.update_value()

	sliders[0].grab_focus()

## Adds bus control to the window.
func add_bus_ctl(bus_idx: int) -> VolumeSlider:
	var bus_name := AudioServer.get_bus_name(bus_idx)

	var label := Label.new()
	label.text = bus_name
	var slider := VolumeSlider.new(bus_idx)

	container.add_child(label)
	container.add_child(slider)

	return slider

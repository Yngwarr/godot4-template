extends PopupPanel

## Spawn this window wherever and whenever you want to change your game options.

## I don't think this will change with time, but whatever.
const MASTER_NAME: StringName = "Master"

## Grid container that will be populated with control elements.
@export var container: GridContainer

var _first_slider: VolumeSlider = null

func _ready() -> void:
	visibility_changed.connect(on_toggle)
	for bus in range(AudioServer.bus_count):
		if !showable_bus(bus): continue

		if _first_slider == null:
			_first_slider = add_bus_ctl(bus)
		else:
			add_bus_ctl(bus)

func on_toggle() -> void:
	if not visible: return
	_first_slider.grab_focus()

## Should the audio bus be accessible from the window? You don't want to show
## your effect buses to be adjustable by a player, that's why we only show
## Master and anything that sends to it (SFX and Music in the most cases).
func showable_bus(bus_idx: int) -> bool:
	return AudioServer.get_bus_name(bus_idx) == MASTER_NAME \
			or AudioServer.get_bus_send(bus_idx) == MASTER_NAME

## Adds bus control to the window.
func add_bus_ctl(bus_idx: int) -> VolumeSlider:
	var bus_name := AudioServer.get_bus_name(bus_idx)

	var label := Label.new()
	label.text = bus_name
	var slider := VolumeSlider.new(bus_idx)

	container.add_child(label)
	container.add_child(slider)

	return slider

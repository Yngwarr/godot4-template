extends Button

## A button to change your scene. Can be used both to switch and to reload a
## scene.

## For some reason, Godot doesn't allow you to have dependency loops when using
## PackedScene, rendering it impossible to use it in some situation (e.g. for a
## restart button on the game over screen). Hence, file name.
@export_file("*.tscn") var next_scene_name: String

## Set to ask for confirmation on button press.
@export var confirm_dialog: ConfirmationDialog

func _ready() -> void:
	if confirm_dialog:
		confirm_dialog.confirmed.connect(proceed)
		pressed.connect(confirm_dialog.show)
	else:
		pressed.connect(proceed)

func proceed() -> void:
	# this is 100% expected behavior
	get_tree().paused = false
	get_tree().change_scene_to_file(next_scene_name)

extends Button

@export var next_scene: PackedScene

## For some reason, Godot doesn't allow you to have dependency loops when using
## PackedScene, rendering it impossible to use it in some situation (e.g. for a
## restart button on the game over screen). Hence, this hack.
## [br][br]
## To use this, leave `next_scene` blank and use this property instead.
@export_file("*.tscn") var next_scene_name: String

func _ready():
	pressed.connect(proceed)

func proceed():
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)
	else:
		get_tree().change_scene_to_file(next_scene_name)

extends Button

## A button to change your scene. Can be used both to switch scenes and to
## reload a scene.

## Usually, it works. If not, try [member next_scene_name].
@export var next_scene: PackedScene

## For some reason, Godot doesn't allow you to have dependency loops when using
## PackedScene, rendering it impossible to use it in some situation (e.g. for a
## restart button on the game over screen). Hence, this hack.
## [br]
## To use this, leave [method next_scene] blank and use this property instead.
@export_file("*.tscn") var next_scene_name: String

func _ready() -> void:
	pressed.connect(proceed)

func proceed() -> void:
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)
	else:
		get_tree().change_scene_to_file(next_scene_name)

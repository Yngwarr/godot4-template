class_name Pause
extends Node

## Must have [code]process_mode == PROCESS_MODE_WHEN_PAUSED[/code].
@export var pause_screen: PauseMenu

var to_drop_next := false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("game_pause"):

		if get_tree().paused:
			unpause()
		else:
			pause()

func pause() -> void:
	to_drop_next = false
	get_tree().paused = true
	pause_screen.pause()

func unpause() -> void:
	if to_drop_next:
		to_drop_next = false
		return

	get_tree().paused = false
	pause_screen.unpause()

func drop_next() -> void:
	to_drop_next = true

extends Node2D

## The game node, the beginning of all, the almighty entry point, the place,
## where your dreams come true! Adjust to your likings and may the code be with
## you.

## Must have [code]process_mode == PROCESS_MODE_WHEN_PAUSED[/code].
@export var pause_screen: CanvasLayer

func _ready() -> void:
	$AnimationPlayer.play("loop")

func _process(_delta) -> void:
	if Input.is_action_just_pressed("game_pause"):
		if not get_tree().paused:
			get_tree().paused = true
			pause_screen.pause()


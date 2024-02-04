extends Node2D

## The game node, the beginning of all, the almighty entry point, the place,
## where your dreams come true! Adjust to your likings and may the code be with
## you.

@export var pause_ctl: Pause
@export var pause_menu: PauseMenu

func _ready() -> void:
	pause_menu.modal_open.connect(pause_ctl.drop_next)
	pause_menu.resume_pressed.connect(pause_ctl.unpause)

	$AnimationPlayer.play("loop")

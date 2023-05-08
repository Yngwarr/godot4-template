extends CanvasLayer

## Your average pause menu you can use to rage quit the game, go outside and
## touch some grass.

@export var resume_button: Button
@export var options_menu: PopupPanel

## A workaround for a sloppy UI input control. Set true if you want the next
## [method _process] frame to be dropped, so input doesn't get processed.
var _drop_frame = true

func _ready() -> void:
	resume_button.pressed.connect(unpause)
	options_menu.visibility_changed.connect(options_toggled)

	resume_button.grab_focus()

func options_toggled() -> void:
	if options_menu.visible: return
	_drop_frame = true

func _process(_delta) -> void:
	if _drop_frame:
		_drop_frame = false
		return

	if Input.is_action_just_pressed("game_pause"):
		unpause()

func pause() -> void:
	_drop_frame = true
	show()
	resume_button.grab_focus()

func unpause() -> void:
	hide()
	get_tree().paused = false

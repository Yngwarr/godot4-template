class_name PauseMenu
extends CanvasLayer

## Your average pause menu you can use to rage quit the game, go outside and
## touch some grass.

signal modal_open
signal resume_pressed

@export var resume_button: Button
@export var options_menu: PopupPanel

func _ready() -> void:
	resume_button.pressed.connect(on_resume_pressed)
	options_menu.visibility_changed.connect(options_toggled)

	resume_button.grab_focus()

func on_resume_pressed() -> void:
	resume_pressed.emit()

func options_toggled() -> void:
	if options_menu.visible:
		return
	modal_open.emit()

func pause() -> void:
	show()
	resume_button.grab_focus()

func unpause() -> void:
	hide()

extends Button

## This button shows a [PopupPanel] you can provide by setting [member popup].

@export var popup: PopupPanel

func _ready() -> void:
	pressed.connect(open_window)

func open_window() -> void:
	popup.visible = true

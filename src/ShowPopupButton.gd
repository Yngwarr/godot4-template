extends Button

@export var popup: PopupPanel

func _ready():
	pressed.connect(open_window)

func open_window():
	popup.visible = true

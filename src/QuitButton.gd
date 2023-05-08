extends Button

func _ready():
	pressed.connect(quit)

func quit():
	get_tree().quit()

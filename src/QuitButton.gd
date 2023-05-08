extends Button

## The only purpose of this button is to close the game.

func _ready() -> void:
	pressed.connect(quit)

## Closing the game in a most straightforward way.
func quit() -> void:
	get_tree().quit()

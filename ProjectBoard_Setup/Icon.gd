# This code simply exists to test our board layout.

extends Sprite
var _CURRENT_GROUP = "orange_spaces"
var _STEP_DELAY = 1

onready var board = get_parent()
onready var end_space = board.get_node("End")
export(int) var CurrentPosition

func _ready():
	pass

# This code simply exists to test our board layout.

extends Sprite
var _CURRENT_GROUP = "orange_spaces"
var _STEP_DELAY = 1

onready var board = get_parent()
onready var end_space = board.get_node("End")
export(int) var CurrentPosition

func _ready():
	var next_space = null
	while next_space != end_space:
		yield(get_tree().create_timer(_STEP_DELAY), "timeout")
		next_space = board.get_next_space(_CURRENT_GROUP, CurrentPosition)
		set_position(next_space.get_position())
		CurrentPosition = next_space.BoardPosition

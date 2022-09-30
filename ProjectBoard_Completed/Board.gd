extends Node2D

onready var end_space = $End

func get_next_space(from_group : String, current_position : int):
	var spaces = get_tree().get_nodes_in_group(from_group)
	spaces.sort_custom(self, "arr_sort_by_board_position")
	var next_space = null
	for space in spaces:
		if space.BoardPosition > current_position:
			next_space = space
			break
	if next_space == null:
		return end_space
	else: 
		return next_space

func arr_sort_by_board_position(a, b):
	return a.BoardPosition < b.BoardPosition

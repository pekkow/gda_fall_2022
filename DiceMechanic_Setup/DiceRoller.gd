extends Node

# An array containing the dice parented to this dice roller
var dice : Array

# The cumulative value of the dice
var value : int = 0

# Declares the array of dice.
# For testing purposes, roll_dice() is called here. 
# However, it is meant to be called outside of this script.
func _ready() -> void:
	pass

# Rolls each individual die, updating the cumulative value of all dice.
func roll_dice() -> void:
	pass

# Returns the cumulative value of all dice.
func get_value() -> int:
	return -1

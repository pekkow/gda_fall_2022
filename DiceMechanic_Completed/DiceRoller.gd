extends Node

# An array containing the dice parented to this dice roller
var dice : Array

# The cumulative value of the dice
var value : int = 0

# Declares the array of dice.
# For testing purposes, roll_dice() is called here. 
# However, it is meant to be called outside of this script.
func _ready() -> void:
	if (self.get_child_count() <= 0):
		print("There are no dice parented to the dice roller.")
	dice = self.get_children()
	roll_dice()
	print("Cumulative dice value: " + str(value))

# Rolls each individual die, updating the cumulative value of all dice.
func roll_dice() -> void:
	value = 0
	for die in dice:
		die.roll()
		value += die.get_value()

# Returns the cumulative value of all dice.
func get_value() -> int:
	return value

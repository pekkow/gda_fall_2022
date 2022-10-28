extends Node

var dice : Array

# The cumulative value of the dice
var value : int = 0

func _ready() -> void:
	if (self.get_child_count() <= 0):
		print("There are no dice parented to the dice roller.")
	dice = self.get_children()
	roll_dice()
	print("Cumulative dice value: " + str(value))

func roll_dice() -> void:
	value = 0
	for die in dice:
		die.roll()
		value += die.get_value()

func get_value() -> int:
	return value

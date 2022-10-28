# Six-sided dice sprites from: https://game-icons.net/tags/dice.html
# Nine-sided dice sprites from: https://commons.wikimedia.org/wiki/File:Dice-8a.svg

extends Sprite
class_name Dice

# The default minimum value of the die.
export (int) var MinValue = 1

# The default maximum value of the die.
export (int) var MaxValue = 6

# The default roll time of the die.
export (int) var RollTime = 2

# The value of the die
var value : int = MinValue

# An array of the dice's textures
# where a die value is mapped to its cooresponding texture.
var dice_textures : Array = []

# Timer representing how long a die roll lasts.
var dice_timer : Timer = null

# Given an array of sprites, 
# append the second array with the sprites' textures.
func add_textures_from_sprites(sprites : Array, to_array : Array) -> void:
	for sprite in sprites:
		to_array.append(sprite.get_texture())

# Upon loading, 
# Instantiate a timer and set its properties 
# and declare dice_textures.
# Also, generate a new random seed.
func _ready() -> void:
	randomize()
	add_textures_from_sprites(get_children(), dice_textures)
	# Add timer node for animation
	dice_timer = Timer.new()
	dice_timer.set_wait_time(RollTime)
	dice_timer.set_autostart(false)
	# The timer will stop once it reaches zero, rather than restarting.
	dice_timer.set_one_shot(true)
	add_child(dice_timer)

# Animates the dice with random textures until the timer runs out.
# Once the time runs out, the correct texture cooresponding to the value is displayed.
func animate_dice(to_value : int, dice_textures : Array, dice_timer : Timer) -> void:
	dice_timer.start()
	# Animate the texture
	while dice_timer.get_time_left() > 0:
		# Hide initial texture
		# Get a random texture in the set [0, size]
		var rand_texture = dice_textures[randi() % dice_textures.size()]
		self.set_texture(rand_texture)
		# Pause until the next frame
		yield(get_tree(), "idle_frame")
		
	# Arrays start at 0, so the range is [MinValue - 1, MaxValue - 1]
	self.set_texture(dice_textures[to_value - 1])
	

# Sets value to a random value in the range [MinValue, MaxValue]
# Also, the die is animated here.
func roll() -> void:
	# Get a random value in the set [MinValue, MaxValue]
	# The function randi() returns a random number between 0 and 2^32-1.
	value = randi() % (MaxValue) + MinValue
	animate_dice(value, dice_textures, dice_timer)

# Simply returns the value of the die.
func get_value() -> int:
	return value

# Six-sided dice sprites from: https://game-icons.net/tags/dice.html
# Nine-sided dice sprites from: https://commons.wikimedia.org/wiki/File:Dice-8a.svg

extends Sprite
class_name Dice

export (int) var MinValue = 1
export (int) var MaxValue = 6
export (int) var RollTime = 2

var value : int = MinValue
var dice_textures : Array = []
var dice_timer : Timer = null

func add_sprites() -> void:
	for sprite in get_children():
		dice_textures.append(sprite.get_texture())
	
func _ready() -> void:
	randomize()
	add_sprites()
	# Add timer node for animation
	dice_timer = Timer.new()
	dice_timer.set_wait_time(RollTime)
	dice_timer.set_autostart(false)
	# The timer will stop once it reaches zero, rather than restarting.
	dice_timer.set_one_shot(true)
	add_child(dice_timer)

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
	

func roll() -> void:
	# Get a random value in the set [MinValue, MaxValue]
	# The function randi() returns a random number between 0 and 2^32-1.
	value = randi() % (MaxValue) + MinValue
	animate_dice(value, dice_textures, dice_timer)

func get_value() -> int:
	return value

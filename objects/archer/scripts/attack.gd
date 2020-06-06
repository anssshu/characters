extends Node

onready var player = get_parent().get_parent()
onready var left_hand = player.get_node("sprite/body/left_hand")
var bow_moving_speed = 3
func on_enter(new_state,old_state):
	#control the left hand with bow rotation
	left_hand.rotation_degrees = player.archer.last_bow_angle
	if player.on_ground:
		player.velocity.x = 0
		
	#when the animation starts or ends it emits a signal to archer node
	#on start an arrow is added to the scene by the archer node
	player.anim.play("attack")
	
func on_exit(old_state,new_state):
	#store the last bow angle setting
	player.archer.last_bow_angle = left_hand.rotation_degrees


func state_logic(delta):
	#control hand rotation
	"""
	if player.controls.up and left_hand.rotation_degrees > -165:
		left_hand.rotation_degrees -= bow_moving_speed
	if player.controls.down and left_hand.rotation_degrees < -60:
		left_hand.rotation_degrees += bow_moving_speed
		"""
	pass
func transition_logic(delta):
	#get back to previous state after attack
	if 	player.controls.attack == false:
		return player.fsm.previous_state
		
	#attack to jump attack
	if player.controls.jump:
		return "jump_attack"
	#attack to duck_attack
	if player.controls.down:
		return "duck_attack"
	return null	

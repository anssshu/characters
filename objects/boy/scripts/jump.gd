extends Node

# JUMP STATE

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	if player.on_ground :
		player.velocity.y =  player.jump_speed
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	if player.controls.left :
		player.velocity.x = -player.air_speed
	elif player.controls.right :
		player.velocity.x = player.air_speed
	else:
		pass
func transition_logic(delta):
	#jump to fall
	if  player.velocity.y > 0	:
		return "fall"
	#jump to wall jump
	if player.controls.jump and player.on_wall:
		return "wall_jump"
	#jump to attack
	if player.controls.attack :
		return "attack"
	return null	

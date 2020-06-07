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
	
	
	return null	

extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	pass
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
	# fall to idle
	if 	player.on_ground :
		return "idle"
	
	
	#fall to attack
	if player.controls.attack :
		return "attack"
	
	#fall to die 
	if player.health == 0:
		return "die"
	return null	

extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	pass
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	if player.fsm.previous_state != "wall_jump" :
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
	#fall to wall_jump
	if player.controls.jump and player.on_wall:
		return "wall_jump"
	#fall to swim 
	if player.in_water:
		return "float"
	#fall to attack
	if player.controls.attack :
		return "attack"
	#fall to wall_slide
	if (player.on_left_wall and player.controls.left) or (player.on_right_wall and player.controls.right) :
		return "wall_slide"
	#fall to die 
	if player.health == 0:
		return "die"
	return null	

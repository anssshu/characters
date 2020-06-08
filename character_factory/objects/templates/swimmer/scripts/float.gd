#FLOAT
extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	player.gravity = 0#2*player.jump_height/pow(player.jump_time,2)
func on_exit(old_state,new_state):
	player.gravity = 2*player.jump_height/pow(player.jump_time,2)
func state_logic(delta):
	if player.controls.left :
		player.velocity.x = -player.swim_speed
	elif player.controls.right :
		player.velocity.x = player.swim_speed
	else :
		player.velocity.x = 0
	if player.controls.down:
		player.velocity.y = player.swim_speed
	
func transition_logic(delta):
	#float swim
	if player.in_water and player.head_in_water:
		return "swim"
	#float to jump
	if (player.in_water and player.controls.jump) or player.in_water == false :
		return "jump"
	# to die 
	if player.health == 0:
		return "die"	
	return null	

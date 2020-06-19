#FLOAT
extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	player.anim.play(new_state)
	player.gravity = 0#2*player.jump_height/pow(player.jump_time,2)
	player.velocity.y =0 
func on_exit(old_state,new_state):
	player.gravity = 2*player.jump_height/pow(player.jump_time,2)
func state_logic(delta):
	#float jump
	if player.controls.up and player.in_water:
		player.velocity.y = player.jump_speed
	
	#left right movement
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
	if player.head_in_water and player.in_water and player.on_wall == false:
		return "swim"
	#float to jump
	#if (player.in_water and player.controls.jump) or player.in_water == false :
	if player.in_water == false :
	
		return "jump"
	# to die 
	if player.health == 0:
		return "die"	
	return null	

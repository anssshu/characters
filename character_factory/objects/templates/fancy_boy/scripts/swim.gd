# SWIM STATE
extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	player.gravity = 0#2*player.jump_height/pow(player.jump_time,2)
func on_exit(old_state,new_state):
	player.gravity =  2*player.jump_height/pow(player.jump_time,2)
func state_logic(delta):
	var dir = Vector2(-1,1)
	if player.controls.left:
		dir.x = -1
	
	elif 	player.controls.right :
		dir.x = 1
	else:
		dir.x = 0
	if player.controls.up :
		dir.y = -1
	
	elif player.controls.down:
		dir.y = 1
	else:
		dir.y = 0
	player.velocity = dir*player.swim_speed
	print(dir)
	
func transition_logic(delta):
	#swim to jump
	if player.in_water == false :
		return "jump"
	#attack to die 
	if player.health == 0:
		return "die"	
	#swim to jump
	return null	

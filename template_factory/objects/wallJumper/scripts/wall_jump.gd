extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	if player.on_left_wall:
		player.velocity = player.wall_jump_speed
		player.face_right = true
		player.face_left = false
	elif player.on_right_wall:
		player.velocity = Vector2(-1*player.wall_jump_speed.x,player.wall_jump_speed.y)
		player.face_right = false
		player.face_left = true
	else:
		pass
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass
func transition_logic(delta):
	#wall jump to fall
	if player.velocity.y > 0 :
		return "fall"	
	#wall jump  to attack
	if player.controls.attack :
		return "attack"
	return null	

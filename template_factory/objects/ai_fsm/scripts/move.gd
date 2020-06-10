extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	if player.move.up and player.on_ground:
		player.velocity.y = player.jump_speed
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	if player.move.left:
		player.velocity.x = -player.walk_speed
	elif player.move.right:
		player.velocity.x = player.walk_speed
	else:
		player.velocity.x = 0
	if player.on_ground and player.move.up:
		player.velocity.y = player.jump_speed
func transition_logic(delta):
	#move to idle
	if player.move.left == false and player.move.right == false and player.move.up == false and player.on_ground:
		return "idle"
	
	if player.health == 0:
		return "die"	
	return null	

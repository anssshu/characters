extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	player.anim.play("run_attack")
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	if player.controls.left :
		player.speed += player.accn*delta
		player.velocity.x = -1*min(player.walk_speed,player.speed)
	elif player.controls.right :
		player.speed += player.accn*delta
		player.velocity.x = min(player.walk_speed,player.speed)
	else:
		player.speed = 0
		player.velocity.x = 0
func transition_logic(delta):
	#run_attack to run
	if (player.controls.left or player.controls.right) and player.controls.attack == false:
		return "run"
	if (player.controls.left or player.controls.right) == false  and player.controls.attack == false:
		return "idle"
	if (player.controls.left or player.controls.right) == false  and player.controls.attack:
		return "attack"
	return null	

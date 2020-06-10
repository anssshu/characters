extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	if old_state == "attack" and player.on_ground:
		player.velocity.y = player.jump_speed
	player.anim.play("jump_attack")
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass	
func transition_logic(delta):
	
	if player.controls.attack == false :
		if player.velocity.y > 0:
			return "fall"
		elif player.velocity.y < 0:
			return "jump"
		else:
			return "idle"
	#jump attack to idle
	if player.on_ground and player.velocity.y == 0:
		return "idle"
	return null	

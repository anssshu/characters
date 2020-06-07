#duck attack
extends Node

onready var player = get_parent().get_parent()
onready var left_hand = player.get_node("sprite/body/left_hand")

func on_enter(new_state,old_state):
	left_hand.rotation_degrees = -100
	player.anim.play("duck_attack")
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass	
func transition_logic(delta):
	if player.controls.attack == false or player.controls.down == false:
		if player.controls.down:
			return "duck"
		else :
			return "idle"
			
	return null	

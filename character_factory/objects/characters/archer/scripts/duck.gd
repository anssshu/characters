#duck
extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	player.anim.play("duck")
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass	
func transition_logic(delta):	
	print("duck")
	#duck to idle
	if player.controls.down == false:
		return "idle"
	#duck to duck attack
	if player.controls.down and player.controls.attack:
		return "duck_attack"
	return null	

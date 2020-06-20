#duck
extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	#switch colliders
	player.get_node("collider").disabled = true
	player.get_node("slide_collider").disabled = false
	
	player.anim.play("duck")
func on_exit(old_state,new_state):
	
	#switch bsck colliders
	player.get_node("slide_collider").disabled = true
	player.get_node("collider").disabled = false
	
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

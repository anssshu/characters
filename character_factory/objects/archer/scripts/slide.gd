# SLIDE STATE
extends Node

onready var player = get_parent().get_parent()
func on_enter(new_state,old_state):
	#switch colliders
	player.get_node("collider").disabled = true
	player.get_node("slide_collider").disabled = false
	
	player.anim.play("duck")
	player.velocity.x = player.velocity.x*4
func on_exit(old_state,new_state):
	#switch bsck colliders
	player.get_node("slide_collider").disabled = true
	player.get_node("collider").disabled = false
func state_logic(delta):
	pass	
func transition_logic(delta):	
	#slide to idle
	if player.controls.down == false and player.on_ground:
		return "idle"
	#slide to fall
	
	return null	

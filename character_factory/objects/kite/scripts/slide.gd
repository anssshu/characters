# SLIDE STATE
extends Node

onready var player = get_parent().get_parent()
func on_enter(new_state,old_state):
	player.anim.play("slide")
	player.velocity.x = player.walk_speed*2*player.velocity.normalized().x
	
	#activate the slide collider and deactivate the main collider
	player.get_node("collider").disabled = true
	player.get_node("slide_collider").disabled = false
func on_exit(old_state,new_state):
	#activate the main collider and deactivate the slide collider
	player.get_node("slide_collider").disabled = true
	player.get_node("collider").disabled = false
	
func state_logic(delta):
	pass	
func transition_logic(delta):	
	#slide to idle
	if player.controls.down == false and player.on_ground:
		return "idle"
	#slide to fall
	if player.velocity.y >10:
		return "fall"
	#slide to die 
	if player.health == 0:
		return "die"
	return null	

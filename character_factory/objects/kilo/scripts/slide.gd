# SLIDE STATE
extends Node

onready var player = get_parent().get_parent()
func on_enter(new_state,old_state):
	#start the slide timer
	$slide_timer.start()
	
	player.get_node("collider").disabled = true
	player.get_node("swim_collider").disabled = false
	
	
	
	player.anim.play("slide")
	player.velocity.x = player.velocity.x*2 
func on_exit(old_state,new_state):
	player.get_node("swim_collider").disabled = true
	player.get_node("collider").disabled = false
func state_logic(delta):
	pass
	#player.velocity.x = player.velocity.x*.98
func transition_logic(delta):	
	#slide to idle
	if player.controls.down == false:
		return "idle"
	#slide to fall
	if player.velocity.y >100:
		return "fall"
	#slide to die 
	if player.health == 0:
		return "die"
	return null	


func _on_slide_timer_timeout():
	if player.fsm.state == "slide":
		player.velocity.x = 0

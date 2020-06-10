# IDLE STATE
extends Node


onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	#play animation
	#player.anim.play("idle")
	#other logic	
	player.velocity = Vector2()
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass	
func transition_logic(delta):
	#idle to fall
	if player.velocity.y > 10:
		return "fall"
	#idle to run
	if player.controls.left or 	player.controls.right :
		return "run"
	#idle to jump
	if player.on_ground and player.controls.jump :
		return "jump"
	
	#idle to die 
	if player.health == 0:
		return "die"
	return null	

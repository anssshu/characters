extends Node

onready var player = get_parent().get_parent()
func on_enter(new_state,old_state):
	pass
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	#jumping attack
	if player.on_ground and player.controls.jump :
		player.velocity.y =  player.jump_speed
		
func transition_logic(delta):
	#get back to previous state after attack
	if 	player.controls.attack == false:
		return player.fsm.previous_state
		
	#attack to slide
	if abs(player.velocity.x) > 200 and player.controls.down:
		return "slide"	
	return null	

# ATTACK STATE
"""
we assume that the player do 
to kind of attacks based on its previous state
1 - statnding_attack
2 - jumping_attack_up
3 - jumping_attack_forward
run and idle to statnding attack
jump and fall to if up pressed  jumping_attack_up
else jumping_attack_forward
"""
extends Node

onready var player = get_parent().get_parent()
func on_enter(new_state,old_state):
	#based on the old state different animation will be played 
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
	#attack to die 
	if player.health == 0:
		return "die"
	return null	

#HIT STATE
#FROM ANY STATE EXCEPT DIE 
extends Node

onready var player = get_parent().get_parent()
var last_state
func on_enter(new_state,old_state):
	last_state = old_state
	$hit_timer.start()
	#carry out the hit logic here
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass	
func transition_logic(delta):
	# to die 
	if player.health == 0:
		return "die"	
	return null	

#when hit timer ticks out return to previous state if state change has not occured
func _on_hit_timer_timeout():
	if player.fsm.state == "hit":
		player.fsm.set_state(last_state)
	

extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	pass
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass	
func transition_logic(delta):
	# to die 
	if player.health == 0:
		return "die"	
	return null	

extends Node


func on_enter(new_state,old_state):
	print("entered into state 2")
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass	
func transition_logic(delta):
	if Input.is_action_pressed("ui_down"):
		return "state1"	
	return null	

extends Node

onready var boss = get_parent().get_parent()
onready var anim = boss.get_node("sprite")

#IDLE STATE
func on_enter(_new_state,_old_state):
	anim.play(boss.fsm.state)
func on_exit(_old_state,_new_state):
	pass
func state_logic(_delta):
	pass	
func transition_logic(_delta):
	# to die 
	if boss.health == 0:
		return "die"	
	return null	

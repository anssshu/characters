extends Node

onready var boss = get_parent().get_parent()
export var duration = 3
func on_enter(new_state,old_state):
	boss.set_ai_timer_duaration(duration)
	boss.anim.play(new_state)
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass	
func transition_logic(delta):
	
	return null	

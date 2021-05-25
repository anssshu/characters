extends Node

onready var boss = get_parent().get_parent()
export var duration = 1
func on_enter(new_state,old_state):
	boss.set_ai_timer_duaration(duration)
	boss.anim.play(new_state)	
	boss.v.x  = 0
func on_exit(old_state,new_state):
	boss.ai_timer.stop()
func state_logic(delta):
	pass
func transition_logic(delta):
	
	
	return null	

extends Node
onready var boss = get_parent().get_parent()
export var duration = 1
var speed = 500
func on_enter(new_state,old_state):
	boss.set_ai_timer_duaration(duration)
	boss.anim.play(new_state)
func on_exit(old_state,new_state):
	boss.v.x = 0
func state_logic(delta):
	if boss.on_left_wall:
		speed = abs(speed)
	elif boss.on_right_wall:
		speed = abs(speed)*-1
	boss.v.x = 0
func transition_logic(delta):
	if abs(boss.player.position.x-boss.position.x) > 120:
		return boss.return_random_states(["idle","chase"])
	return null	

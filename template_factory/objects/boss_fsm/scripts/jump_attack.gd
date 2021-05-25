extends Node

onready var boss = get_parent().get_parent()
export var duration = 6
var speed = 500
func on_enter(new_state,old_state):
	boss.set_ai_timer_duaration(duration)
	boss.anim.play(new_state)
func on_exit(old_state,new_state):
	boss.v.x = 0
func state_logic(delta):
	if boss.on_ground:
		boss.v.y = boss.jump_speed*1.2	
	if boss.on_left_wall:
		speed = abs(speed)
	elif boss.on_right_wall:
		speed = abs(speed)*-1
	boss.v.x = speed
func transition_logic(delta):
	
	return null	

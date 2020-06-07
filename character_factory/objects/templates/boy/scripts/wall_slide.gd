extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	if player.on_left_wall:
		player.face_left = true
		player.face_right = false
	
	if player.on_right_wall:
		player.face_left = false
		player.face_right = true
	
	player.gravity =  0
	player.velocity.y= 0
	get_child(0).start()
func on_exit(old_state,new_state):
	player.gravity = -player.jump_speed/player.jump_time
func state_logic(delta):
	#player.velocity.y= 0
	pass
func transition_logic(delta):	
	
	#wall_slide  to wall_jump
	if player.controls.jump:
		return "wall_jump"
		
	#wall_slide to fall 
	if (player.controls.left or player.controls.right) == false  :
		return "fall"
	
	#wall_slide to idle
	if player.on_ground:
		return "idle"
		
	return null	


func _on_wall_slide_timer_timeout():
	if player.fsm.state == "wall_slide":
		player.velocity.y = 100
		#player.gravity = -.5*(player.jump_speed/player.jump_time)

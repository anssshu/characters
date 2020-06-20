extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	
	player.GRAVITY = 0 
	player.velocity.y= 150
	player.anim.play("wall_slide")
func on_exit(old_state,new_state):
	player.GRAVITY = -player.JUMPSPEED/player.jump_time
func state_logic(delta):
	#player.velocity.y= 0
	pass
func transition_logic(delta):	
	#wall_slide  to wall_jump
	if player.controls.jump:
		return "wall_jump"
	#wall_slide to fall 
	if (player.controls.left or player.controls.right) == false or player.on_wall == false :
		return "fall"
	
	#wall_slide to idle
	if player.on_ground:
		return "idle"
		
	return null	

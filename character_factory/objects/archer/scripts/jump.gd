extends Node

# JUMP STATE

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	player.anim.play("jump")
	#player.anim_state_machine.travel("jump")
	if player.on_ground :
		player.velocity.y =  player.JUMPSPEED
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	if player.controls.left :
		player.velocity.x = -player.AIRSPEED
	elif player.controls.right :
		player.velocity.x = player.AIRSPEED
	else:
		pass
func transition_logic(delta):
	#jump to fall
	if  player.velocity.y > 0	:
		return "fall"
	#jump to wall jump
	if player.controls.jump and player.on_wall:
		return "wall_jump"
	#jump to jump_attack
	if player.controls.attack :
		return "jump_attack"
	#jump to wall_slide
	if (player.on_left_wall and player.controls.left) or (player.on_right_wall and player.controls.right) :
		return "wall_slide"
	return null	

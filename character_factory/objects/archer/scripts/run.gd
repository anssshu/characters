# RUN STATE
extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	player.anim.play("run")
	#player.anim_state_machine.travel("run")
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	if player.controls.left :
		player.speed += player.ACCN*delta
		player.velocity.x = -1*min(player.WALKSPEED,player.speed)
	elif player.controls.right :
		player.speed += player.ACCN*delta
		player.velocity.x = min(player.WALKSPEED,player.speed)
	else:
		player.speed = 200
		player.velocity.x = 0
func transition_logic(delta):
	# run to idle
	if ((player.controls.left or player.controls.right) == false  and player.on_ground) :
		return "idle"
	#run to jump	
	if player.on_ground and player.controls.jump :
		return "jump"
	#run to slide
	if player.controls.down :
		return "slide"
	#run to attack
	if player.controls.attack :
		return "attack"
	#run to fall
	if player.on_ground == false and player.velocity.y>0:
		return "fall"
	return null	

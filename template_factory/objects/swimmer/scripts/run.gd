# RUN STATE
extends Node

onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	pass
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	if player.controls.left :
		player.speed += player.accn*delta
		player.velocity.x = -1*min(player.walk_speed,player.speed)
	elif player.controls.right :
		player.speed += player.accn*delta
		player.velocity.x = min(player.walk_speed,player.speed)
	else:
		player.speed = 0
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
	if player.velocity.y > 10:
		return "fall"
	#run  to die 
	if player.health == 0:
		return "die"
	
	return null	

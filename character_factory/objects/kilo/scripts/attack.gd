# ATTACK STATE
"""
we assume that the player do 
to kind of attacks based on its previous state
1 - statnding_attack
2 - jumping_attack_up
3 - jumping_attack_forward
run and idle to statnding attack
jump and fall to if up pressed  jumping_attack_up
else jumping_attack_forward
"""
extends Node

onready var player = get_parent().get_parent()
func on_enter(new_state,old_state):
	player.get_node("sprite/sprite/root/body/left_arm/left_forearm/stick").show()
	#player.get_node("sprite/sprite/root/body/hanging _sword").hide()
	if player.on_ground :
		player.anim.play("attack_standing")
	else:
		player.anim.play("attack_jumping")
	if old_state == "jump":
		player.anim.play("attack_jumping ")
	#based on the old state different animation will be played 
	pass
func on_exit(old_state,new_state):
	player.animation_finished = false
	player.get_node("sprite/sprite/root/body/left_arm/left_forearm/stick").hide()
	#player.get_node("sprite/sprite/root/body/hanging _sword").show()
	player.get_node("sprite/sprite/arc").hide()
func state_logic(delta):
	#stop if running
	if player.on_ground:
		player.velocity.x = 0
	#jumping attack
	#if player.on_ground and player.controls.jump :
		#player.velocity.y =  player.jump_speed
		
func transition_logic(delta):
	if player.animation_finished:
		#attack to swim
		if player.in_water:
			return "float"
		#attack to idle
		if player.on_ground and player.controls.attack == false:
			return "idle"
		#attack to jump:
		if player.controls.jump:
			return "jump"
		#attack to jumping attack
		#if player.on_ground and player.controls.jump and player.controls.attack :
			#return "attack_jumping"
		#attack to die 
		if player.health == 0:
			return "die"
	return null	

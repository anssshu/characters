extends Node

onready var player = get_parent().get_parent()
func on_enter(new_state,old_state):
	player.anim.play("attack")
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	#jumping attack
	if player.on_ground and player.controls.jump :
		player.velocity.y =  player.jump_speed
		
func transition_logic(delta):
	#get back to previous state after attack
	#if 	player.controls.attack == false:
		#return player.fsm.previous_state
	#attack to jump attack
	if player.controls.jump and player.controls.attack:
		return "jump_attack"
	# attack to run attack
	if (player.controls.left or player.controls.right) and player.controls.attack:
		return "run_attack"
	if (player.controls.left or player.controls.right) and player.controls.attack == false:
		return "run"
	if (player.controls.left or player.controls.right) == false and player.controls.attack == false:
		return "idle"	
	return null	

# IDLE STATE
extends State


onready var player = get_parent().get_parent()

func on_enter(new_state,old_state):
	player.velocity = Vector2()
func on_exit(old_state,new_state):
	pass
func state_logic(delta):
	pass	
func transition_logic(delta):
	#idle to run
	if player.controls.left or 	player.controls.right :
		return "run"
	#idle to jump
	if player.on_ground and player.controls.jump :
		return "jump"
	#idle to attack
	if player.controls.attack :
		return "attack"
	return null	

extends Node

onready var player = get_parent().get_parent()
onready var old_g
func on_enter(new_state,old_state):
	$timer.start()
	player.anim.play("air_dash")
	old_g = player.gravity
	player.gravity = 0
	if old_state != "air_dash" and player.air_dash_count == 0:
		player.air_dash_count = 1
		if player.face_left:
			player.velocity = Vector2(-player.air_dash_speed,0)
		elif player.face_right:
			player.velocity = Vector2(player.air_dash_speed,0)
func on_exit(old_state,new_state):
	player.gravity = old_g
func state_logic(delta):
	pass	
func transition_logic(delta):
	#air_dash_fall
	#if player.controls.dash == false:
		#return "fall"
	#airdash to idle
	if player.controls.dash == false and player.on_ground :
		return "idle"
	# to die 
	if player.health == 0:
		return "die"	
	return null	


func _on_timer_timeout():
	if player.fsm.state == "air_dash":
		player.fsm.set_state("fall")
		player.velocity.x = player.walk_speed*player.velocity.normalized().x
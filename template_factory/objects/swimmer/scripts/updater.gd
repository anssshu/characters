#it calls all auxiliary functions of the player each frame
extends Node

onready var player = get_parent()

func update(delta):
	player.get_node("label").set_text(str(player.fsm.state))
	update_sprite_facing()
	if player.health == 0:
		player.fsm.set_state("die")
	
	

#determine the facing of the player sprite
func update_sprite_facing():
	var sx = abs(player.get_node("sprite").scale.x)
	if  player.velocity.x <0 :#controls.left and (player.on_ground or player.in_water):
		
		player.face_left = true
		player.face_right= false
		
	elif player.velocity.x > 0:#.controls.right and (player.on_ground or player.in_water):
		
		player.face_right = true
		player.face_left = false
		
	else:
		pass
		
	if  player.face_left and player.fsm.state != "die":
		player.get_node("sprite").scale.x = -1*sx
		
	elif player.face_right and player.fsm.state != "die":
		player.get_node("sprite").scale.x = sx
		
	else:
		pass

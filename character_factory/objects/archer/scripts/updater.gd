#it calls all auxiliary functions of the player each frame
extends Node

onready var player = get_parent()

func update(delta):
	#print(player.velocity.y)
	player.get_node("label").set_text(str(player.fsm.state))
	update_sprite_facing()
	
	#logic for death
	if player.health == 0:
		player.fsm.set_state("die")
	
	

#determine the facing of the player sprite
func update_sprite_facing():
	var sx = abs(player.get_node("sprite").scale.x)
	if  player.controls.left:
		
		player.face_left = true
		player.face_right= false
		
	elif player.controls.right:
		
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

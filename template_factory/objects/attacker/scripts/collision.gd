# this script will handle player collision
# motion script checks and update for collision
extends Node

onready var player = get_parent()

#code to handle player collision	
func on_collision(col):
	
	var other = col.collider
	var normal = col.normal
	
	#print("collided with :",other.name)

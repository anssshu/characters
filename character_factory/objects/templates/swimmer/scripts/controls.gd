# this script is for checking the player controls
extends Node

#var for all the motion controls

var left
var right
var up
var down
var jump 
var attack

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	left = Input.is_action_pressed("ui_left")
	right = Input.is_action_pressed("ui_right")
	up = Input.is_action_pressed("ui_up")
	down = Input.is_action_pressed("ui_down")
	jump = Input.is_action_just_pressed("ui_up")
	attack = Input.is_action_pressed("ui_select")

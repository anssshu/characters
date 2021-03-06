"""
This script will make  the player controller 
like fanny pant and hollow knight like  character
"""



extends KinematicBody2D


var  gravity  
var jump_height = 64*3+32
var jump_time = .35
#max walk speed
var air_dash_speed = 2000
var walk_speed = 600
var jump_speed = 0
var air_speed = 800
var wall_jump_speed #= Vector2(400,-600)
var player_accn_time = .4
var accn 

var health = 100
var speed = 0

var velocity = Vector2()
var n = Vector2(0,-1)

var on_ground = false
var on_wall = false
var on_left_wall = false
var on_right_wall = false
var in_water = false
var in_air = false

var face_left = false
var face_right = true

onready var controls = $controls
onready var fsm = $fsm
onready var motion = $motion
onready var updater = $updater
onready var collision = $collision

#store player animation
onready var anim = $sprite

onready var label = $label


func _ready():
	gravity = 2*jump_height/pow(jump_time,2)
	jump_speed = -sqrt(2*gravity*jump_height)
	wall_jump_speed = Vector2(air_speed,jump_speed)
	accn = walk_speed/player_accn_time
	fsm.set_state("fall")
	label.set_text("fall")
	
func _physics_process(delta):
	
	controls.update(delta)
	fsm.update(delta)
	motion.update(delta)
	updater.update(delta)
	
	
	

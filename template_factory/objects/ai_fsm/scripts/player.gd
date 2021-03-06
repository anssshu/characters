extends KinematicBody2D


var  gravity  
export var jump_height = 120
export var jump_time = .5

var walk_speed = 400
var jump_speed = -600
var air_speed = 300
var wall_jump_speed = Vector2(400,-400)

var accn = 2000

var health = 100
var speed = 0

var velocity = Vector2()
var n = Vector2(0,-1)

var on_ground = false
var on_wall = false
var on_left_wall = false
var on_right_wall = false
var in_water = false

var face_left = false
var face_right = true

var move = {
	left = false,
	right = false,
	up = false,
	down = false
}

onready var ai = $ai
onready var fsm = $fsm
onready var motion = $motion
onready var updater = $updater
onready var collision = $collision


onready var label = $label


func _ready():
	gravity = 2*jump_height/pow(jump_time,2)
	jump_speed = -sqrt(2*gravity*jump_height)
	
	fsm.set_state("idle")
	label.set_text("idle")
	
func _physics_process(delta):
	
	ai.update(delta)
	fsm.update(delta)
	motion.update(delta)
	updater.update(delta)
	
	
	

extends KinematicBody2D


const GRAVITY = 1200.0 
const WALKSPEED = 800
const JUMPSPEED = -600
const AIRSPEED = 300
const WALLJUMPSPEED = Vector2(400,-400)
const ACCN = 2000

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

onready var controls = $controls
onready var fsm = $fsm
onready var motion = $motion
onready var updater = $updater
onready var collision = $collision


onready var label = $label


func _ready():
	fsm.set_state("fall")
	label.set_text("fall")
	
func _physics_process(delta):
	
	controls.update(delta)
	fsm.update(delta)
	motion.update(delta)
	updater.update(delta)
	
	
	

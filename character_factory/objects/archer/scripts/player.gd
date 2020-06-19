extends KinematicBody2D
#class_name Archer

var family = "Archer" 
# this is a kinematic player class for declaring all the player parameters

var GRAVITY = 1200.0 
var jump_height = 320
var jump_time = .4
const WALKSPEED = 600
var JUMPSPEED = -700
const AIRSPEED = 400
const WALLJUMPSPEED = Vector2(400,-400)
const ACCN = 800

var velocity = Vector2()
var n = Vector2(0,-1)

var health = 100
var speed = 0

var on_ground = false
var on_wall = false
var on_left_wall = false
var on_right_wall = false
var in_water = false

var face_left = false
var face_right = true

#animation player
onready var anim = $sprite/anim

#player components

#user inputs
onready var controls = $controls
#archer behaviour
onready var archer = $archer
#finite state machine
onready var fsm = $fsm
#player motion
onready var motion = $motion
#all aux. utilities needs to be updated every frame
onready var updater = $updater
#collision handler
onready var collision = $collision

#initialise player
func _ready():
	GRAVITY = 2*jump_height/pow(jump_time,2)
	JUMPSPEED = -GRAVITY*jump_time
	#set player the initial state
	fsm.set_state("fall")
	$label.set_text(str(fsm.state))


#update all the player components
func _physics_process(delta):

	#update controls for inputs
	controls.update(delta)
	
	# update the finite state machine
	fsm.update(delta)
	
	#update the archer
	archer.update(delta)

	# update motion 
	motion.update(delta)
	
	#update updater
	updater.update(delta)
	


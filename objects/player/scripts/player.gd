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
var left = false
var right = true

onready var controls = $controls
onready var motion = $motion
onready var fsm = $fsm

func _ready():
	#connect my_signal for collision detection
	self.connect("my_signal",self,"on_collision")
	#initialize connection for collision detection

func _physics_process(delta):
	#update controls for inputs
	controls.update(delta)
	
	calculate_sprite_facing()
	check_ray_cast()	
	check_collision(delta)
	
	# update the finite state machine
	fsm.update(delta)
	
	#logic for death
	if health == 0:
		fsm.set_state("die")
	
	# motion logic
	velocity.y += delta * GRAVITY	
	velocity =  move_and_slide(velocity, n)
	
	
	
func check_ray_cast():
	#determine object is on ground or not on the basis of ray collision
	if $down.is_colliding():
		on_ground = true
	else:
		on_ground = false
		
	if $left.is_colliding():
		on_left_wall = true
	else:
		on_left_wall = false
	if $right.is_colliding():
		on_right_wall = true
	else:
		on_right_wall = false
		
	if on_left_wall or on_right_wall:
		on_wall = true
	else:
		on_wall = false
func calculate_sprite_facing():
	if  controls.left:
		left = true
		right = false
	elif controls.right:
		right = true
		left = false
	else:
		pass
		
	if  left:
		$sprite.scale.x = -1
	elif right:
		$sprite.scale.x = 1
	else:
		pass
func check_collision(delta):
	#check for collision
	var c = move_and_collide(velocity*delta) #it holds collision data
	if c:
		emit_signal("my_signal",c)
		#calculate collision normal
		n = c.normal
		
		
		#print("collision:",c)
	else:
		n=Vector2(0,-1)	
func on_collision(c):
	#print(c.normal)	
	pass

extends KinematicBody2D

var g =1200
var left
var right
var jump

var walk_speed = 250
var jump_height = 32*4+16
var jump_time = .3
var jump_speed
var v
var c
# Called when the node enters the scene tree for the first time.
func _ready():
	$camera.current = true
	
	v= Vector2()
	g = 2*jump_height/pow(jump_time,2)
	jump_speed = -sqrt(g*2*jump_height)
func _physics_process(dt):
	c = move_and_collide(v*dt)
	left = Input.is_action_pressed("ui_left")
	right = Input.is_action_pressed("ui_right")
	jump = Input.is_action_just_pressed("ui_up")
	
	#sprite facing based on velocity
	if v.x>0:
		$sprite.flip_h = false
	if v.x<0:
		$sprite.flip_h = true
		
	if left:
		v.x = -walk_speed
		
	elif right:
		v.x = walk_speed
		
	else:
		if is_on_floor():
			v.x = 0 
		
	if is_on_floor() and jump:
		v.y = jump_speed
		
	v.y += g*dt
	v = move_and_slide(v,Vector2(0,-1))
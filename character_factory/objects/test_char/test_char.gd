extends KinematicBody2D

#This is the main script for the player control


var v 
var g
#the player is 64 px high and jumps 4 times its height
var jump_height = 64*4
var jump_time = .35

var walk_speed = 520
var wall_jump_speed = 320
var jump_speed = 500
var wall_speed = 320
var G #= 2*jump_height/pow(jump_time,2)
#for collision data
var c 

var face = "right"
var ray = Vector2(20,0)

var left
var right
var up 
var down

var jump
var wall_jump
var jump_count = 0 

var on_ground
var on_wall
var in_air
var last_place = "air"
var current_place = "air"
# initialize the character
func _ready():
	$camera.current = true
	#initialize velocity and gravity
	v=Vector2()
	G = 2*jump_height/pow(jump_time,2)
	jump_speed = sqrt(2*G*jump_height)
	g=Vector2(0,G)	
	
	
#--------------------------------------------------------------------
#func _draw():
	#draw_line(Vector2(),ray,Color(1,0,0,1))

#------------------------------------------------------

#-----------------------------------------------------------
func move(dt):
	#print(global_position)
	v+=g*dt
	#var c = move_and_collide(v*dt)
	v = move_and_slide(v, Vector2(0,-1))
#--------------------------------------------------------------	
func process_input():
	left = Input.is_action_pressed("ui_left")
	right = Input.is_action_pressed("ui_right")
	up = Input.is_action_pressed("ui_up")
	down = Input.is_action_pressed("ui_down")
	jump = Input.is_action_just_pressed("ui_up")
	wall_jump = Input.is_action_pressed("ui_accept")
	
#--------------------------------------------------------
func handle_facing():
	#for setting the face of the player
	if Input.is_action_just_pressed("ui_left"):
		face = "left"
	if Input.is_action_just_pressed("ui_right"):
		face = "right"
	#determine the face direction
	if face == "right":
		$sprite.flip_h = false
		ray.x = 20
	if face == "left":
		$sprite.flip_h = true
		ray.x = -20
				
func handle_jump(dt):
	#player will be able to jump if on ground or after 0.4 second stay in air
	jump_count += dt
	#jump 	
	if jump and (on_ground or jump_count > .4):
		v.y = -jump_speed
		#reset jump counter
		jump_count = 0
	#reset jump_counter 
	if jump_count > 10:
		jump_count = 0
#-----------------------------------------------------------------------		
func handle_wall_jump():
	#if the player is on the wall and wall_jump button is pressed
	
	#wall jump
	if on_wall and wall_jump and face == "left":
		face = "right"
		v.y= -wall_jump_speed
		v.x = wall_jump_speed
		print(face)
	elif on_wall and wall_jump and face == "right":
		face = "left"
		v.y= -wall_jump_speed
		v.x = -wall_jump_speed
		print(face)
#-----------------------------------------------------------------------	
func handle_on_ground_motion():
	#normal ground motion
	if left and not (left and up):
		v.x = -walk_speed
	if right and  not (right and up):
		v.x = walk_speed
func handle_on_air_motion():
	pass
func handle_on_wall_motion():	
	if on_wall and up:
		v.y = -wall_speed
	if on_wall and down:
		v.y = wall_speed
	#stop on wall
	if on_wall and not (up or down):
		v.y = 0
func stop():
	
	# stop on ground
	if not(left or right or jump or wall_jump) and (on_ground ):
		v.x = 0
#----------------------------------------------------------------
func move_character(dt):
	#set the ray cast to find whether the object is on ground or not
	$raycast.cast_to = ray
	
	#determine where the object is 
	on_ground = is_on_floor()
	
	on_wall = $raycast.is_colliding()
	
	in_air = not (on_wall or on_ground)
	
	if is_on_floor():
		last_place = current_place
		current_place = "ground"
		
	if on_wall:
		last_place = current_place
		current_place = "wall"
		
	if in_air:
		last_place = current_place
		current_place = "air"
		
	#when change of place  occurs
	if current_place != last_place:
		if current_place == "air":
			g = Vector2(0,G)
		if current_place == "wall":
			g = Vector2()
			v = Vector2(0,0)
			print(v)
		if current_place == "ground":
			v = Vector2()
	
	#process inputs
	process_input()
	
	#determine on_ground motion
	handle_on_ground_motion()
	
	#determine on_air_motion
	handle_on_air_motion()

	#determine on_wall_motion
	handle_on_wall_motion()

	#jump logic
	handle_jump(dt)
	
	#wall jump logic 
	handle_wall_jump()
	
	#determine facing of the character
	handle_facing()
	
	#determine the stop logic for the player
	stop()
	
	#finally move the character
	move(dt)
func _physics_process(dt):
	#update the _draw method
	#update() 

	#move the kinematic character
	move_character(dt)
	
	
	
	
		
	
	
	
	
	
	
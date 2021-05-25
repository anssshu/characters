extends KinematicBody2D


var v = Vector2() #velocity
var _g
var g = 600	      #gravityvar
var jump_speed
var jump_height = 300
var jump_time = .4

var health = 100
var face = "left"


var on_ground = false
var on_wall = false
var on_left_wall = false
var on_right_wall = false

onready var fsm = $fsm

#FRAME BY FRAME ANIMATION
onready var anim = $anim/AnimatedSprite

#CUT OUT ANIMATION
#onready var anim = $anim/AnimationPlayer
onready var ai_timer = $ai/ai_timer

# Called when the node enters the scene tree for the first time.
func _ready():
	#calculate jump speed and gravity
	_g = 2*jump_height/pow(jump_time,2)
	jump_speed = -_g*jump_time
	g=_g
	
	#print(fsm.states)
	fsm.set_state("idle")
	
	#start ai logic 

	
func _physics_process(delta):
	$label.text = fsm.state
	
	#ray collisions
	check_player_on_ground()
	check_player_on_left_wall()
	check_player_on_right_wall()
	check_player_on_wall()
	
	#handle facing
	handle_player_facing()
	
	#update player fsm
	fsm.update(delta)
	
	v.y+=g*delta
	v = move_and_slide(v,Vector2(0,-1))







#----------------------------------HELPER FUNCTION ---------------------------
func check_player_on_ground():
	if $down.is_colliding():
		on_ground = true
	else:
		on_ground = false
		
		
		
		
func check_player_on_left_wall():
	if $left.is_colliding():
		on_left_wall = true
	else:
		on_left_wall = false
		
		
		
		
		
func check_player_on_right_wall():
	if $right.is_colliding():
		on_right_wall = true
	else:
		on_right_wall = false
		
		
		
		
func check_player_on_wall():
	if on_left_wall or on_right_wall :
		on_wall = true
	else:
		on_wall = false		
		
		
		
func handle_player_facing():
	if v.x > 0:
		face = "right"
	if v.x < 0:
		face = "left"
		

		
	if face == "left":
		$anim.scale.x = abs($anim.scale.x)
	if face == "right":
		$anim.scale.x = -abs($anim.scale.x)



#function to reset timer
func set_ai_timer_duaration(time:int)->void:
	ai_timer.stop()
	ai_timer.wait_time = time
	ai_timer.start()	
#helper function to state random state



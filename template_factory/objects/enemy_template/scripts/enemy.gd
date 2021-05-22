
#collison layer for platform =1, water = 2 ,player = 3, enemy = 4 

#collision layer = 4 for enemy
#collision mask =  1 so the it will collide with platform and area 2ds
#group enemy
#kinematic body 2d collider is for taking damage and collision with platform
#area 2d collide's with player's kinematic body 2d collider for causing player damage

#THIS IS SINGLE SCRIPT ENEMY TEMPLATE
#FOR MORE ADVANCED ONE USE BOSS TEMPLATE

extends KinematicBody2D



#----------------------------------OBJECT VARIABLES ----------------------------

var current_state = null setget set_state
var states = {}
var previous_state = null

onready var parent = get_parent()

var health = 100
var v = Vector2()
var face = "left"
var walk_speed = 150
var g = 600	


var on_ground = false
var on_wall = false
var on_left_wall = false
var on_right_wall = false

var inside_attack_range_of_enemy = false



#-----------------------------------INITIALIZE--------------------------------	
# Called when the node enters the scene tree for the first time.
func _ready():
	$attack_others.connect("body_entered",self,"_on_attack_body_entered")
	$sprite.connect("animation_finished",self,"_on_sprite_animation_finished")
	
	$health_bar.hide()
	#state of the character
	add_state("idle")
	
	add_state("die")
	set_state("idle")

#---------------------------------UPDATE EVERY FRAME ------------------------
func _physics_process(delta):
	$label.text = current_state
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
			
	if v.x > 0:
		face = "right"
	if v.x < 0:
		face = "left"
		
	if face == "left":
		$sprite.scale.x = abs($sprite.scale.x)
	if face == "right":
		$sprite.scale.x = -abs($sprite.scale.x)
	
	_update(delta)
	
	v.y+=g*delta
	move_and_slide(v,Vector2(0,-1))
	
#--------------------------STATE LOGIC ----------------------------------------	
func on_enter(new_state,old_state):
	match current_state:
		"idle":
			$sprite.play("idle")
		
		"die":
			$sprite.play("die")
			v.x = 0

func transition_logic(delta):
	if health == 0:
		return "die"
	match current_state:
		"idle":
			return null
	return null			
			
func state_logic(delta):
	match current_state:
		"idle":
			pass
	
			
func on_exit(old_state,new_state):
	match previous_state:
		"idle":
			pass
			
#when attack animation finished change state back to walk
func _on_sprite_animation_finished():
	pass

#--------------- STATE MACHINE HELPER FUNCTIONS --------------------------------
func add_state(state_name):
	var s = states.get(state_name)
	if s == null:
		states[state_name] = states.size()
		
func set_state(new_state):
	previous_state = current_state
	current_state = new_state
	
	if previous_state != null :
		on_exit(previous_state,current_state)
	if new_state:
		on_enter(current_state,previous_state)

func _update(delta):
	$label.text = current_state
	if current_state != null:
		state_logic(delta)
	var transition = transition_logic(delta)
	if transition != null:
		set_state(transition)




#------------------------------END OF STAE LOGIC--------------------------------

#----------------------------- ATTACK PLAYER -------------------------
#for attacking player an area 2d  object will be used to collide with the players kinematic body 2d's collider
#cause damage to player
func _on_attack_body_entered(body):
	#print(body.name)
	if body.is_in_group("player") and  current_state != "die":
		#if body.fsm.state != "slide":
		#get into attack state
		var del_x = (body.position.x-position.x)
		print(del_x)
		if del_x < 0 :
			face = "left"
		elif del_x > 0:
			face = "right"
		set_state("attack")
		
		#hurt player
		body.hurt()
		body.velocity.x = 0
		#damage health by 20 unit
		if body.health > 0:
			body.health -= 20
		

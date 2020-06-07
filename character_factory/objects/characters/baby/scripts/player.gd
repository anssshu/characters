#baby
extends KinematicBody2D

export var stone_class:PackedScene
var  gravity  
var jump_height = 160
var jump_time = .35
#max walk speed
var walk_speed = 400
var jump_speed = -300
var air_speed = 200
var wall_jump_speed = Vector2(600,-400)
var player_accn_time = .35
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

var face_left = false
var face_right = true

onready var controls = $controls
onready var fsm = $fsm
onready var motion = $motion
onready var updater = $updater
onready var collision = $collision

onready var anim = $anim

onready var label = $label


func _ready():
	gravity = 2*jump_height/pow(jump_time,2)
	jump_speed = -sqrt(2*gravity*jump_height)
	accn = walk_speed/player_accn_time
	fsm.set_state("fall")
	label.set_text("fall")
	
func _physics_process(delta):
	
	controls.update(delta)
	fsm.update(delta)
	motion.update(delta)
	updater.update(delta)
	
	print(in_water)


func _on_anim_animation_started(anim_name):
	if anim_name in ["attack","jump_attack","run_attack"]:
		var stone = stone_class.instance()
		stone.position = global_position+Vector2(50,-180)
		get_tree().root.call_deferred("add_child",stone)


func _on_anim_animation_finished(anim_name):
	if anim_name in ["attack","jump_attack","run_attack"] and fsm.state == anim_name:
		anim.play(anim_name)

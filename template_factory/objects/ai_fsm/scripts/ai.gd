extends Node

onready var player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	move_left()


func update(delta):
	if player.on_left_wall:
		jump_right()
	if player.on_right_wall:
		jump_left()
	
	
func face_left():
	player.face_left = true
	player.face_right = false
func face_right():
	player.face_left = false
	player.face_right = true

func move_left():
	face_left()
	player.move.left = true
	player.move.right = false
	player.move.up = false
	player.move.down = false
	
func move_right():
	face_right()
	player.move.left = false
	player.move.right = true
	player.move.up = false
	player.move.down = false
	
func jump_up():
	player.move.left = false
	player.move.right = false
	player.move.up = true
	player.move.down = false

func jump_left():
	face_left()
	player.move.left = true
	player.move.right = false
	player.move.up = true
	player.move.down = false

func jump_right():
	face_right()
	player.move.left = false
	player.move.right = true
	player.move.up = true
	player.move.down = false
	
func stop():
	
	player.move.left = false
	player.move.right = false
	player.move.up = false
	player.move.down = false
	

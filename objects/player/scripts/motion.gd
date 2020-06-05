extends Node

signal my_signal

onready var player = get_parent()

func _ready():
	#connect my_signal for collision detection
	self.connect("my_signal",self,"on_collision")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	
	#calculate collision normal
	check_collision(delta)
	
	#check if player is on ground or wall
	check_ray_cast()
	
	# move the player
	player.velocity.y += delta * player.GRAVITY	
	player.velocity =  player.move_and_slide(player.velocity, Vector2(0,-1))



#-------------------------------------------
func check_collision(delta):
	#check for collision
	var c = player.move_and_collide(player.velocity*delta) #it holds collision data
	if c:
		emit_signal("my_signal",c)
		#calculate collision normal
		player.n = c.normal		
		#print("collision:",c)
	else:
		player.n=Vector2(0,-1)	
#----------------------------------------	
func check_ray_cast():
	#determine object is on ground or not on the basis of ray collision
	if player.get_node("down").is_colliding():
		player.on_ground = true
	else:
		player.on_ground = false
		
	if player.get_node("left").is_colliding():
		player.on_left_wall = true
	else:
		player.on_left_wall = false
	if player.get_node("right").is_colliding():
		player.on_right_wall = true
	else:
		player.on_right_wall = false
		
	if player.on_left_wall or player.on_right_wall:
		player.on_wall = true
	else:
		player.on_wall = false		
#-------------------------------------------------		
#code for handling collision
func on_collision(c):
	#print(c.normal)	
	player.collision.on_collision(c)

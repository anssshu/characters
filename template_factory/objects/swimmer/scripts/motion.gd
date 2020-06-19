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
	#check player is in water or not
	player.in_water = is_in_water()
	#check player is completely immersed in water or not
	player.head_in_water = is_head_in_water()
	#check if player is on ground or wall
	check_ray_cast()
	
	# move the player
	player.velocity.y += delta * player.gravity	
	player.velocity =  player.move_and_slide(player.velocity, Vector2(0,-1))



#-------------------------------------------
func check_collision(delta):
	#check for collision
	var cnt = player. get_slide_count()#player.move_and_collide(player.velocity*delta) #it holds collision data
	if cnt !=0:
		var c = player.get_slide_collision(0)
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
func is_in_water():
	var torso = player.get_node("positions/torso_marker")
	var s = player.get_world_2d().direct_space_state
	#water is at collision layer 2 and mask 2
	var t = s.intersect_point(player.global_position+torso.position,1,[],2)
	if t.size() == 1:
		return true
	else :
		return false
func is_head_in_water():
	var head = player.get_node("positions/head_marker")
	var s = player.get_world_2d().direct_space_state
	#water is at collision layer 2 and mask 2
	var t = s.intersect_point(player.global_position+head.position,1,[],2)
	if t.size() == 1:
		return true
	else :
		return false
#code for handling collision
func on_collision(c):
	#print(c.normal)	
	player.collision.on_collision(c)

extends Node



onready var player = get_parent()
onready var anim = player.get_node("sprite/anim")
onready var left_hand = player.get_node("sprite/body/left_hand")
var left_hand_angle
#var to store the last setting of the 
var last_bow_angle = -85
#create a signal for connecting the attacke animation
onready var arrow_class = preload("res://objects/archer/arrow/arrow.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	#connect animation for start and end of attack animation
	anim.connect("animation_started",self,"on_animation_start")
	anim.connect("animation_finished",self,"on_animation_finished")
	

# warning-ignore:unused_argument
func update(dt):
	#get the bow rotation angle 
	left_hand_angle = left_hand.rotation_degrees

#when attack animation completes restart it
func on_animation_finished(anim_name):
	if anim_name == "attack":
		anim.play("attack")
	if anim_name == "duck_attack":
		anim.play("duck_attack")	
#add an arrow with call_deffered to root on start of attack animation		
func on_animation_start(anim_name):
	if anim_name == "attack" or anim_name == "duck_attack":
		var arrow = arrow_class.instance()
		arrow.angle = -1*(75+left_hand_angle)
		if arrow.angle < -25:
			if anim_name == "attack":
				arrow.angle = -1*(75+last_bow_angle)
			else:
				arrow.angle = 25
			
		arrow.speed +=abs(player.velocity.x)
		
		var pos = Vector2(0,-80)
		if anim_name == "duck_attack":
			pos = Vector2(0,-60)
		
		#print("hand angle",left_hand_angle)
		if player.face_right:
			
			arrow.position = player.global_position+pos
		if player.face_left :
			arrow.position = player.global_position+pos
			arrow.v.x = -1*abs(arrow.v.x)
			#arrow.v.x += player.velocity.x
			arrow.angle = 180 - arrow.angle
		#print(global_position)
		get_tree().root.call_deferred("add_child",arrow)

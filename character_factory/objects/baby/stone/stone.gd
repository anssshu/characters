extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var implode:PackedScene
var g = Vector2(0,1650)
var u = Vector2(1800,-600)
var v = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	
	# on_begin_contact
	self.connect("body_entered",self,"on_begin_contact")
	v=u
	#print(v)
func _enter_tree():
	var player = get_tree().root.get_node("level/baby")
	position = player.position+Vector2(-20,-40)
	if player.face_left:
		u.x=-1*u.x
		u += Vector2(player.velocity.x,0)
	if player.face_right:
		u += Vector2(player.velocity.x,0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	v+=  g*delta
	position +=v*delta
	

#collision with physics body 2d
func on_begin_contact(body):
	print("collided with ",body)
	if body.name != "baby":
		var s = implode.instance()
		s.position = self.position
		get_tree().root.add_child(s)
		self.queue_free()
		
#collision with area 2d
func _on_stone_area_entered(area):
	pass # Replace with function body.

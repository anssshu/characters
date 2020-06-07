extends Area2D
var v = Vector2()
var speed = 1200
var g = 600
var angle = 0
func _ready():
	#speed = 10*abs(angle)
	angle += 5*randf()
	self.rotation_degrees = -angle
	v.x = speed*cos(deg2rad(-angle))
	v.y = speed*sin(deg2rad(-angle))
func _physics_process(dt):
	v.y += g*dt
	position += v*dt
	if v.x > 0 :
		self.rotation = atan(v.y/v.x)
	if v.x < 0:
		self.rotation = PI + atan(v.y/v.x)
	#print(v.x)

func _on_arrow_body_entered(body):
	var family = body.get("family")
	
	if family != "Archer":
		v = Vector2(0,0) 
		g = 0
 


func _on_Timer_timeout():
	queue_free()

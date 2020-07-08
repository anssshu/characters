extends Node2D

onready var scorpio = get_parent()
func _draw():
	draw_rect(Rect2(-50,-50,100,10),Color.red,true)
	draw_rect(Rect2(-50,-50,scorpio.health,10),Color.green,true)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	update()

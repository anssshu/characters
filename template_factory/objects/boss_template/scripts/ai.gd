#code for boss ai
extends Node


var boss
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	boss = get_parent()
	timer = $ai_timer
	timer.connect("timeout",self,"on_ai_timer_timeout")
	
	#timer.start()

func on_ai_timer_timeout():
	match boss.fsm.state:
		"idle":
			pass
		"die":
			timer.stop()


func set_timer(wait_time):
	timer.stop()
	timer.wait_time = wait_time
	timer.start() 

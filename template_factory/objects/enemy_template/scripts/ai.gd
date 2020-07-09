#code for enemy ai
extends Node


var agent
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	agent = get_parent()
	timer = $ai_timer
	timer.connect("timeout",self,"on_ai_timer_timeout")
	
	timer.start()

func on_ai_timer_timeout():
	match agent.current_state:
		"idle":
			pass
		"die":
			timer.stop()


func set_timer(wait_time):
	timer.stop()
	timer.wait_time = wait_time
	timer.start() 

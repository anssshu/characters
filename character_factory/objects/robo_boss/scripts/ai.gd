extends Node


onready var boss = get_parent()




#function to set a random state
func set_random_states(state_list):
	var choosed_state = state_list[randi()%len(state_list)]
	boss.fsm.set_state(choosed_state)

#called when ai_timer ticks and set a random state from the list
func _on_ai_timer_timeout():
	print("ai_timer")
	#set a random state based on state
	match boss.fsm.state:
		#IDLE ----->
		"idle":
			var state_list = ["chase","jump"]
			set_random_states(state_list)
		#JUMP_ATTACK
		"attack":
			var state_list = ["idle","attack","jump"]
			set_random_states(state_list)
			
		#RUN_ATTACK
		"chase":
			#var state_list = ["attack","idle"]
			#set_random_states(state_list)
			pass
		#jump
		"jump":
			var state_list = ["idle"]
			set_random_states(state_list)
			

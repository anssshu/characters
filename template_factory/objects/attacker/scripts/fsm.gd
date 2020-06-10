extends Node


var state = null setget set_state
var states = {}
var previous_state = null

onready var parent = get_parent()

func _ready():
	var children  = self.get_children()
	for child in children:
		states[child.name] = child
	
	

func update(delta):
	if state != null:
		state_logic(delta)
	var transition = transition_logic(delta)
	if transition != null:
		set_state(transition)
		print(transition)

func state_logic(delta):
	var state_obj = states.get(state)
	if state_obj :
		state_obj.state_logic(delta)
	
func transition_logic(delta):
	var state_obj = states.get(state)
	if state_obj :	
		return state_obj.transition_logic(delta)
	
func on_enter(new_state,old_state):
	var state_obj = states.get(new_state)
	if state_obj :
		state_obj.on_enter(new_state,old_state)
		
func on_exit(old_state,new_state):
	var state_obj = states.get(old_state)
	if state_obj :
		state_obj.on_exit(old_state,new_state)
	
func set_state(new_state):
	previous_state = state
	state = new_state
	
	if previous_state != null :
		on_exit(previous_state,state)
	if new_state:
		on_enter(state,previous_state)


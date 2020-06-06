extends Player


#animation player
onready var anim = $sprite/anim

#player components

#user inputs
onready var controls = $controls
#archer behaviour
onready var archer = $archer
#finite state machine
onready var fsm = $fsm
#player motion
onready var motion = $motion
#all aux. utilities needs to be updated every frame
onready var updater = $updater
#collision handler
onready var collision = $collision

#initialise player
func _ready():
	#set player the initial state
	fsm.set_state("fall")
	$label.set_text(str(fsm.state))


#update all the player components
func _physics_process(delta):

	#update controls for inputs
	controls.update(delta)
	
	# update the finite state machine
	fsm.update(delta)
	
	#update the archer
	archer.update(delta)

	# update motion 
	motion.update(delta)
	
	#update updater
	updater.update(delta)
	


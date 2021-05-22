extends Node2D


export var state_no:int = 1 

#ENEMY VARIABLES


onready var fsm = $fsm

#FRAME BY FRAME ANIMATION
onready var anim = $anim/AnimatedSprite

#CUT OUT ANIMATION
#onready var anim = $anim/AnimationPlayer

func _ready():
	#set the initial state
	match state_no:
		1:
			fsm.set_state("state1")
		2:
			fsm.set_state("state2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$label.text = fsm.state
	fsm.update(delta)

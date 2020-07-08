extends Area2D

var boss


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered",self,"_on_attack_others_body_entered")
	boss = get_parent()



#-----------------------------CAUSE DAMAGE TO  PLAYER -------------------------
#for attacking player an area 2d  object will be used to collide with the players kinematic body 2d's collider
#boss area 2d causes damage to player kinematic body2d
func _on_attack_others_body_entered(body):
	#print(body.name)
	if body.is_in_group("player") and  boss.fsm.state != "die":
		var player = body
		
#------------------------------TAKE DAMAGE FROM PLAYER---------------------------
#               code for dame from player is inside the player script
#                                                                    

extends AnimationPlayer

onready var player = get_parent().get_parent().get_parent()

func _on_AnimationPlayer_animation_started(anim_name):
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	player.animation_finished = true
	if anim_name in ["idle","run","attack_jumping","attack_standing","float","swim"]:
		play(anim_name)

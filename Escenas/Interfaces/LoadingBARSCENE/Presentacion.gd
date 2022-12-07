extends CanvasLayer



func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Escenas/Interfaces/Menu/PRSSTART.tscn")
	queue_free()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.playback_speed = 10

extends CanvasLayer

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$sign_save/ico/anim_up.play("up")
	if Input.is_action_just_released("ui_cancel"):
		$sign_save/ico/anim_up.play_backwards("up")

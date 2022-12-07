extends Timer

func _on_timerquit_timeout():
	get_tree().quit()

func _process(delta):
	_quit_funcion()

func _quit_funcion():
	if Input.is_action_just_pressed("ui_cancel"):
		$".".start()
		$CanvasLayer/X/AnimationPlayer.play("quiting")
	elif Input.is_action_just_released("ui_cancel"):
		$".".stop()
		$CanvasLayer/X/AnimationPlayer.play("cancelar")
	

extends Area2D


func _process(delta):
	pass




func detect_enemy(area):
	if area.is_in_group("ENEMY"):
		$name_text.text = str(area.Nombre)
		$vida_text.text = str(area.Vida) + "/" + str(area.MAX_vida)
	else:
		pass

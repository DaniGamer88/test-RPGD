extends Area2D

export (String) var Escena
export (String) var number_map



func _on_Portal_body_entered(body):
	if body.name == "jugador":
		body.UP = false
		body.DOWN = false
		body.RIGHT = false
		body.LEFT = false
		body.ESC = false
		yield(get_tree().create_timer(0.9),"timeout")
		get_tree().change_scene("res://Escenas/Mapas/Map" + number_map + "/" + "zone" + Escena + ".tscn")
	pass

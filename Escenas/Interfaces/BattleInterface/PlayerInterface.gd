extends Area2D


func _process(delta):
	player_stats()


func player_stats():
	$name_text.text = str(Inventario.Nombre)
	$tp_text.text = str(Inventario.TP) + "%"
	$vida_text.text = str(Inventario.Vida) + "/" + str(Inventario.MAX_vida)
	$Lv_text.text = "Lv" + str(Inventario.Nivel)

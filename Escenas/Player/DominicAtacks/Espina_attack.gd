extends Node2D

var espina = preload("res://Escenas/Player/DominicAtacks/Espina.tscn")

var pos_select = 2

func _ready():
	$".".position = Vector2(455,50)

func _on_Timer_timeout():
	
	pos_select += 1
	
	if pos_select == 2:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D2.global_position
		$Timer.start()
	
	elif pos_select == 3:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D3.global_position
		$Timer.start()
	
	elif pos_select == 4:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D4.global_position
		$Timer.start()
	
	elif pos_select == 5:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D5.global_position
		$Timer.start()
	
	elif pos_select == 6:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D6.global_position
		$Timer.start()
	
	elif pos_select == 7:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D7.global_position
		$Timer.start()
	
	elif pos_select == 8:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D8.global_position
		$Timer.start()
	
	elif pos_select == 9:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D9.global_position
		$Timer.start()
	
	elif pos_select == 10:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D10.global_position
		$Timer.start()
	
	elif pos_select == 11:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D11.global_position
		$Timer.start()
	
	elif pos_select == 12:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D12.global_position
		$Timer.start()
	
	elif pos_select == 13:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D13.global_position
		$Timer.start()
	
	elif pos_select == 14:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D14.global_position
		$Timer.start()
	
	elif pos_select == 15:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D15.global_position
		$Timer.start()
	
	elif pos_select == 16:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D16.global_position
		$Timer.start()
	
	elif pos_select == 17:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D17.global_position
		$Timer.start()
	
	elif pos_select == 18:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D18.global_position
		$Timer.start()
	
	elif pos_select == 19:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D19.global_position
		$Timer.start()
	
	elif pos_select == 20:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D20.global_position
		$Timer.start()
	
	elif pos_select == 21:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D21.global_position
		$Timer.start()
	
	elif pos_select == 22:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D22.global_position
		$Timer.start()
	
	elif pos_select == 23:
		var new_espina = espina.instance()
	
		get_parent().call_deferred("add_child", new_espina)
		new_espina.position = $Position2D23.global_position
		$Timer.start()
	
	elif pos_select == 24:
		queue_free()

extends Area2D

const FOLLOW_SPEED = 8.0

var toggle = preload("res://Escenas/Player/DominicAtacks/Toggle.tscn")

var hurt = 5

func _ready():
	hurt = hurt * Inventario.Ataque
	$Aparecer.play()
	
	var random_number = RandomNumberGenerator.new()
	random_number.randomize()
	$Number.text = str(random_number.randi_range(1,888))
	
	if $Number.text == "888":
		hurt += 400

func _physics_process(delta):
	var enemy_pos = get_parent().get_child(3)

	$".".position = $".".position.linear_interpolate(enemy_pos.position, delta * FOLLOW_SPEED)



func _on_Spawn_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("BOSS"):
		Inventario.TP += 2
		var new_toggle_1 = toggle.instance()
		get_parent().call_deferred("add_child", new_toggle_1)
		
		var new_toggle_2 = toggle.instance()
		get_parent().call_deferred("add_child", new_toggle_2)
		
		var new_toggle_3 = toggle.instance()
		get_parent().call_deferred("add_child", new_toggle_3)
		
		new_toggle_1.position = $PosicionToggle.global_position
		new_toggle_2.position = $PosicionToggle2.global_position
		new_toggle_3.position = $PosicionToggle3.global_position
		
		queue_free()
	else:
		pass

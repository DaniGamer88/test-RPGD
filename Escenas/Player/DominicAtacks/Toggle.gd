extends Area2D

const FOLLOW_SPEED = 8.0

var hurt = 5

func _ready():
	hurt = hurt * Inventario.Ataque
	$Aparecer.play()
	
	var random_number = RandomNumberGenerator.new()
	random_number.randomize()
	$Number.text = str(random_number.randi_range(1,888))
	
	if $Number.text == "888":
		hurt = 888

func _physics_process(delta):
	var enemy_pos = get_parent().get_child(3)

	$".".position = $".".position.linear_interpolate(enemy_pos.position, delta * FOLLOW_SPEED)



func _on_Toggle_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("BOSS"):
		queue_free()
		Inventario.TP += 2
	else:
		pass

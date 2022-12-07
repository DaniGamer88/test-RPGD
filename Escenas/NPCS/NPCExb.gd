extends Area2D

signal final_1
signal final_true

var hurt_medidor = preload("res://Escenas/Interfaces/BattleInterface/TextoDaño.tscn")

var Nombre = "Exbor"
var Vida = 1000
var MAX_vida = 1000


func _process(delta):
	_vida()


func _ready():
	pass

########################CUANDO ES GOLPEADO################################################
func _on_NPCExb_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if Vida == 0:
		emit_signal("final_1")
		$CollisionShape2D.set_deferred("disabled", true)
	
	if area.is_in_group("hurt"):
		$reset_dps.start()
		
		Vida -= area.hurt
		$BossAnimation.play("pegado")
	
		var new_medidor = hurt_medidor.instance()
		$".".add_child(new_medidor)
		new_medidor.rect_position = Vector2(-91, -91)
		new_medidor.get_child(0).get_child(0).text = str(area.hurt)
		$"dañado".play()

func _vida():
	if Vida < 0:
		Vida = 0
################################################################################

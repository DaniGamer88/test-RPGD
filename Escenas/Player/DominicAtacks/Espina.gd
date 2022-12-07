extends Area2D

var hurt = 13

func _ready():
	hurt = hurt * Inventario.Ataque
	$appear.play()
	$AnimationPlayer.play("aparecer")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_Espina_area_entered(area):
	Inventario.TP += 3

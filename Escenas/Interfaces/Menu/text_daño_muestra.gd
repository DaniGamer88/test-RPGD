extends Label

onready var anima = $anim

func animacion_finalizada(anim_name):
	queue_free()

func _ready():
	if get_parent().get_parent().focus_select_style == 1:
		$anim.play("anim1")
	elif get_parent().get_parent().focus_select_style == 2:
		$anim.play("anim2")
	elif get_parent().get_parent().focus_select_style == 3:
		$anim.play("anim3")
	elif get_parent().get_parent().focus_select_style == 4:
		$anim.play("anim4")
	elif get_parent().get_parent().focus_select_style == 5:
		$anim.play("anim5")

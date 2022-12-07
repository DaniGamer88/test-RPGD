extends CanvasLayer

const window_profile = preload("res://Escenas/Interfaces/Menu/Select_profile.tscn")
var PRSS = true


func _process(delta):
	if PRSS and Input.is_action_just_pressed("ui_accept"):
		$prss/anim.play("prss")
		PRSS = false
		yield(get_tree().create_timer(0.8),"timeout")
		$".".add_child(window_profile.instance())

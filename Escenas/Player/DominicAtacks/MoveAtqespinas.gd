extends Node2D

var toggle = preload("res://Escenas/Player/DominicAtacks/Toggle.tscn")

var Z = true
var coold_toggle = 0

func _process(delta):
	$Interfazbotones/BarTime.value = $Interfazbotones/TimerB.time_left
	
	
	if Z and Input.is_action_just_pressed("ui_accept"):
		var new_toggle = toggle.instance()
		Z = false
		coold_toggle += 1
		new_toggle.position = $Position2D.position
		get_parent().add_child(new_toggle)
		yield(get_tree().create_timer(0.2),"timeout")
		Z = true
	
	if coold_toggle == 3:
		Z = false
		coold_toggle = 3

func _on_TimerB_timeout():
	Z = false
	yield(get_tree().create_timer(1),"timeout")
	queue_free()

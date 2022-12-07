extends Area2D

const save_window = preload("res://Escenas/Interfaces/Pausa/SaveScreen.tscn")
var area = false

func _on_Checkpoint_body_entered(body):
	if body.name == 'jugador':
		area = true

func _on_Checkpoint_body_exited(body):
	area = false

func _process(delta):
	if area == true and Input.is_action_just_pressed("ui_accept"):
		get_parent().add_child(save_window.instance())
		get_tree().paused = true

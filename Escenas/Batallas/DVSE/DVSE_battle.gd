extends Node

var turnos = 1

#############################ATAQUES DEL JUGADOR##########################################
var ataque_toggle_trip = preload("res://Escenas/Player/DominicAtacks/MoveAtqespinas.tscn")
var espina_move_ataque = preload("res://Escenas/Player/DominicAtacks/Espina_attack.tscn")
var spawn_toggle = preload("res://Escenas/Player/DominicAtacks/Spawn.tscn")
##########################################################################################

func _ready():
	$jugador/AnimationPlayer.play("en_batalla")

extends KinematicBody2D

signal mini_detect
signal desmini_detect

var Mini = false





func Detectar_objetos(body):
	
	if body.name == "PortalMini":
		Mini = true
		emit_signal("mini_detect")
	else:
		pass

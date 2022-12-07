extends KinematicBody2D

var VELOCIDAD = 400
var Velocidad_principal = Vector2()
var direccion = 1
var SALTO = 470
var gravedad = 2300
var FLOOR = Vector2(0, -1)

var Mini = $".".get_parent()
var tecla = true

func _physics_process(delta):
	Velocidad_principal.x = VELOCIDAD * direccion
	
	if tecla and Input.is_action_just_pressed("clic_principal"):
		Velocidad_principal.y = -SALTO
		
	Velocidad_principal.y += gravedad * delta
	Velocidad_principal = move_and_slide(Velocidad_principal , FLOOR)
	
	
	if not is_on_floor():
		tecla = false
		$AnimationPlayer.play("girando")
	else:
		$AnimationPlayer.stop()
		tecla = true
		$Sprite.rotation_degrees = 0


func _on_PlayerPrincipalLayout_mini_detect():
	$transformacion_anim.play("mini")

func _on_PlayerPrincipalLayout_desmini_detect():
	$transformacion_anim.play_backwards("mini")

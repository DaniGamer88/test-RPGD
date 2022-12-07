extends CanvasLayer


export (bool) var X = false


func _ready():
	yield(get_tree().create_timer(0.8),"timeout")
	X = true

func _process(delta):
	quit()
	pressed()
	detect_characters()

##########################FUNCIONES DE INTERFAZ#####################################################
func quit():
	if X and Input.is_action_just_pressed("ui_select"):
		X = false
		performancesext.Transicion.animation.play("go-map")
		yield(get_tree().create_timer(0.3),"timeout")
		get_tree().change_scene("res://Escenas/Interfaces/Menu/Interfaz.tscn")
		queue_free()

func pressed():
	if Input.is_action_just_pressed("ui_right"):
		$flecha_der/anim.play("press")
	if Input.is_action_just_pressed("ui_left"):
		$flecha_izq/anim.play("press")

func detect_characters():
	pass
####################################################################################################

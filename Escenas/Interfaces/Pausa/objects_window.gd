extends CanvasLayer

export (bool) var X = true

var player

func _ready():
	$options/BttnsScroll/container/obj_1.grab_focus()

func _process(delta):
	player = $".".get_parent()
	quit()
	detect_items()
	detect_empty_obj()

func quit():
	if X and Input.is_action_just_pressed("ui_select"):
		$animacion.play_backwards("appear")
		yield(get_tree().create_timer(0.3),"timeout")
		get_tree().paused = false
		queue_free()


###########################DETECTAR LOS OBJETOS Y SI ESTAN VACIOS###################################
func detect_items():
	#obj1
	$options/BttnsScroll/container/obj_1/tittle.text = str(player.objs["obj_1"]["NAME"])
	$options/BttnsScroll/container/obj_1/info.text = str(player.objs["obj_1"]["INFO"])

func detect_empty_obj():
	pass
####################################################################################################

####################################USAR OBJETOS####################################################
func _on_obj_1_pressed():
	$options/BttnsScroll/container/obj_1/button/anim.play("press")
	player.data["VIDA"] += player.objs["obj_1"]["HEALS"]
	player.objs["obj_1"]["VACIO"] = true
####################################################################################################

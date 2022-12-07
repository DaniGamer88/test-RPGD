extends CanvasLayer


export (bool) var X = true

func _ready():
	$window/BttnsScroll/container/logro1.grab_focus()

func _process(delta):
	logros_detect()
	
	if X and Input.is_action_just_pressed("ui_select"):
		$animacion.play_backwards("appear")
		yield(get_tree().create_timer(0.3),"timeout")
		get_parent().bttn_logros.grab_focus()
		queue_free()



##################################SISTEMA DE LOGROS#################################################
func logros_detect():
	#logro 1
	$window/BttnsScroll/container/logro1/tittle.text = str(performancesext.logros["logro_1"]["name"])
	$window/BttnsScroll/container/logro1/info.text = str(performancesext.logros["logro_1"]["info"])
	$window/BttnsScroll/container/logro1/porcent.value = performancesext.logros["logro_1"]["porcent"]
	
	#logro 2
	$window/BttnsScroll/container/logro2/tittle.text = str(performancesext.logros["logro_2"]["name"])
	$window/BttnsScroll/container/logro2/info.text = str(performancesext.logros["logro_2"]["info"])
	$window/BttnsScroll/container/logro2/porcent.value = performancesext.logros["logro_2"]["porcent"]
	
	
	if performancesext.logros["logro_1"]["porcent"] == 100:
		$window/BttnsScroll/container/logro1/porcent.hide()
		$window/BttnsScroll/container/logro1/icono_block.hide()
####################################################################################################



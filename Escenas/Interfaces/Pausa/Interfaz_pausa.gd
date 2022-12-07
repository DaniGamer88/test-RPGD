extends CanvasLayer

######################################ESCENAS CONSTANTES############################################
const OPTIONS_pop_up = preload("res://Escenas/Interfaces/Menu/Options_window.tscn")
const OBJS_ui = preload("res://Escenas/Interfaces/Pausa/objects_window.tscn")
####################################################################################################



export (bool) var X = true

onready var bttn_op = $configuration



func _ready():
	get_tree().paused = true
	$continue.grab_focus()



# warning-ignore:unused_argument
func _process(delta):
	_batery()
	player_info()
	
	var datetime = OS.get_datetime()
	$Cuadro/hora_bateria/Reloj/text.text = get_time(datetime)
	
	
	if X and Input.is_action_just_pressed("ui_select"):
		queue_free()
		get_tree().paused = false


#########################INTERFAZ Y FUNCIONES DE DETALLES###########################################
func _batery(): #####FUNCION DE BATERIA
	$Cuadro/hora_bateria/bateria/barbatery.value = OS.get_power_percent_left()
	$Cuadro/hora_bateria/bateria/barbatery/porcent_Text.text = str($Cuadro/hora_bateria/bateria/barbatery.value) + "%"
	
	if $Cuadro/hora_bateria/bateria/barbatery.value < 21:
		$Cuadro/hora_bateria/bateria/barbatery.tint_progress = Color("#ff0000")
	elif $Cuadro/hora_bateria/bateria/barbatery.value < 22:
		$Cuadro/hora_bateria/bateria/barbatery.tint_progress = Color("#ffffff")
	
	if $Cuadro/hora_bateria/bateria/barbatery.value < 21:
		$Cuadro/hora_bateria/bateria/barbatery/Animacion.play("Low_battery")
	else:
		$Cuadro/hora_bateria/bateria/barbatery/Animacion.play("RESET")
	
	if OS.get_power_percent_left() < 1:
		$Cuadro/hora_bateria/bateria.hide()
	else:
		$Cuadro/hora_bateria/bateria.show()
	
	if OS.get_power_state() == 3 or OS.get_power_state() == 4:
		pass
	elif OS.get_power_state() == 1:
		pass

func get_time(time):  ####FUNCION DEL TIEMPO
	var meridiem = "AM"
	var hour = time.hour
	
	if hour > 12:
		meridiem = "PM"
		hour -= 12
	
	var minute = "%02d" % time.minute
	var time_return = str(hour) + ":" + str(minute) + str(meridiem)
	return time_return

func player_info():
	$Cuadro/tittle.text = str(get_parent().data["name"])
	$Cuadro/bar_life_player/text.text = str(get_parent().data["VIDA"]) + "/" + str(get_parent().data["VIDA_MAX"])
	$Cuadro/bar_life_player.value = get_parent().data["VIDA"]
	$Cuadro/bar_life_player.max_value = get_parent().data["VIDA_MAX"]
	$Cuadro/money.text = str(get_parent().data["money"])
####################################################################################################



###############################FOCUS BUTTONS AND PRESS##############################################
func _on_continue_focus_entered():
	$continue/anim.play("focus")
func _on_continue_focus_exited():
	$continue/anim.play_backwards("focus")
func _on_continue_pressed():
	queue_free()
	get_tree().paused = false

func _on_quit_focus_entered():
	$quit/anim.play("focus")
func _on_quit_focus_exited():
	$quit/anim.play_backwards("focus")
func _on_quit_pressed():
	performancesext.get_child(0).animation.play("go-map")
	$quit.release_focus()
	performancesext.AudioMusic.play_mu()
	
	yield(get_tree().create_timer(0.3),"timeout")
	
	performancesext.AudioMusic.text_info_mus()
	performancesext.AudioMusic.stream = load("res://Main Resources/Sonidos/Interfaz/menuLoop.mp3")
	performancesext.AudioMusic.texto.text = "menuLoop but it's Megalovania / Mudstep"
	
	get_tree().change_scene("res://Escenas/Interfaces/Menu/Select_battle_UI.tscn")
	get_tree().paused = false
	queue_free()


func _on_configuration_focus_entered():
	$configuration/anim.play("focus")
func _on_configuration_focus_exited():
	$configuration/anim.play_backwards("focus")
func _on_configuration_pressed():
	X = false
	$".".add_child(OPTIONS_pop_up.instance())

func _on_Objetos_focus_entered():
	$Objetos/anim.play("focus")
func _on_Objetos_focus_exited():
	$Objetos/anim.play_backwards("focus")
func _on_Objetos_pressed():
	get_parent().add_child(OBJS_ui.instance())
	queue_free()

func _on_Objetos_clave_focus_entered():
	$Objetos_clave/anim.play("focus")
func _on_Objetos_clave_focus_exited():
	$Objetos_clave/anim.play_backwards("focus")
####################################################################################################

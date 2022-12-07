extends CanvasLayer

const POP_up_advertence = preload("res://Escenas/Interfaces/PopUPS/POPupDeleteSav1.tscn")

export (bool) var X = true

const FOLLOW_SPEED = 31.0
var focus_pos = 1

var name_1 = ""
var name_2 = ""
var name_3 = ""

onready var bttn1 = $CONTROL/Scroll/HboxButtons/Button1
onready var bttn2 = $CONTROL/Scroll/HboxButtons/Button2
onready var bttn3 = $CONTROL/Scroll/HboxButtons/Button3

onready var tittle = $CONTROL/Tittle


func _ready():
	get_tree().paused = true
	yield(get_tree().create_timer(0.6),"timeout")
	$CONTROL/Scroll/HboxButtons/Button1.grab_focus()

func _process(delta):
	_detect_slot()
	_detect_focus(delta)
	
	if X and Input.is_action_just_pressed("ui_select"):
		performancesext.create_directory()
		var interfaz = get_parent()
		queue_free()
		get_tree().paused = false
		queue_free()
		interfaz.queue_free()
		get_tree().change_scene("res://Escenas/Interfaces/LoadingBARSCENE/MainLoad.tscn")



###########################FUNCION DE DETECTAR LOS ESPACIOS#########################################
func _detect_slot():
	var Directorio_1 = Directory.new()
	var Directorio_2 = Directory.new()
	var Directorio_3 = Directory.new()
	
	
	
	if Directorio_1.dir_exists("C://RPG dash/save1"):
		$CONTROL/Scroll/HboxButtons/Button1/Text.text = str(name_1)
		$CONTROL/Scroll/HboxButtons/Button1.disabled = false
	else:
		$VboxButtons/Button1/Text.text = "vacio"
		$CONTROL/Scroll/HboxButtons/Button1.disabled = true
	
	if Directorio_2.dir_exists("C://RPG dash/save2"):
		$CONTROL/Scroll/HboxButtons/Button2/Text.text = str(name_2)
		$CONTROL/Scroll/HboxButtons/Button2.disabled = false
		$VboxButtons/Button2.self_modulate = Color("#ffffff")
	else:
		$CONTROL/Scroll/HboxButtons/Button2/Text.text = "vacio"
		$CONTROL/Scroll/HboxButtons/Button2.disabled = true
	
	if Directorio_3.dir_exists("C://RPG dash/save3"):
		$CONTROL/Scroll/HboxButtons/Button3/Text.text = str(name_3)
		$CONTROL/Scroll/HboxButtons/Button3.disabled = false
		$VboxButtons/Button3.self_modulate = Color("#ffffff")
	else:
		$CONTROL/Scroll/HboxButtons/Button3/Text.text = "vacio"
		$CONTROL/Scroll/HboxButtons/Button3.disabled = true
	
	
	var file_name_1 = File.new()
	if not file_name_1.file_exists("C://RPG dash/save1/name_user"):
		return
	file_name_1.open("C://RPG dash/save1/name_user", File.READ)
	name_1 = file_name_1.get_line()
	file_name_1.close()
	
	var file_name_2 = File.new()
	if not file_name_2.file_exists("C://RPG dash/save2/name_user"):
		return
	file_name_2.open("C://RPG dash/save2/name_user", File.READ)
	name_2 = file_name_2.get_line()
	file_name_2.close()
	
	var file_name_3 = File.new()
	if not file_name_3.file_exists("C://RPG dash/save3/name_user"):
		return
	file_name_3.open("Cs://RPG dash/save3/name_user", File.READ)
	name_3 = file_name_3.get_line()
	file_name_3.close()
####################################################################################################

##########################FUNCIONES DE ENFOQUE######################################################
func _on_Button1_focus_entered():
	$FOCUS.play()
	focus_pos = 1

func _on_Button2_focus_entered():
	$FOCUS.play()
	focus_pos = 2

func _on_Button3_focus_entered():
	$FOCUS.play()
	focus_pos = 3


func _detect_focus(delta):
	if focus_pos == 1:
		pass
	elif focus_pos == 2:
		pass
	elif focus_pos == 3:
		pass
####################################################################################################


#########################FUNCIONES DE PRESION#######################################################
func _on_Button1_pressed():
	$".".add_child(POP_up_advertence.instance())
	bttn2.hide()
	X = false
	tittle.text = "eliminar?"
	bttn3.hide()
	$PRESS.play()

func _on_Button2_pressed():
	$".".add_child(POP_up_advertence.instance())
	bttn1.hide()
	bttn3.hide()
	X = false
	tittle.text = "eliminar?"
	$PRESS.play()

func _on_Button3_pressed():
	bttn2.hide()
	bttn1.hide()
	X = false
	tittle.text = "eliminar?"
	$".".add_child(POP_up_advertence.instance())
	$PRESS.play()
####################################################################################################

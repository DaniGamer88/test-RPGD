extends CanvasLayer

#######################CONSTANTES DE ESCENAS###########################################
const POP_up_create_name = preload("res://Escenas/Interfaces/Menu/InterfazTeclado.tscn")
const LOGROS_pop_up = preload("res://Escenas/Interfaces/Menu/Logros_window.tscn")
const OPTIONS_pop_up = preload("res://Escenas/Interfaces/Menu/Options_window.tscn")
const STATS_pop_uo = preload("res://Escenas/Interfaces/Menu/stats_window.tscn")
const POP_up_profile = preload("res://Escenas/Interfaces/PopUPS/menu/pop_up_profile.tscn")

const DIAG = preload("res://Escenas/Interfaces/Dialog/dialog_solo.tscn")
#######################################################################################

#######################CONSTANTES DE FLOAT#############################################
#######################################################################################


############################ONREADY VARS BUTTONS#####################################
######################################################################################


####################ONREADY VARS#######################################################
onready var bttn_hist = $Botones/ModoHistoria
onready var bttn_logros = $botones_chiquitos/Logros
onready var bttn_op = $botones_chiquitos/Opciones
onready var bttn_stats = $botones_chiquitos/Stats
onready var bttn_play = $Botones/ModoHistoria
onready var bttn_mas = $Botones/mas
onready var bttn_profile = $profile_button
#######################################################################################



############################VARIBLE DE TECLAS y otras#########################################
var X = false
##############################################################################################





func _ready():
	profile_detect()
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	

func _process(delta):
	$profile_button/name.text = str(performancesext.user_name)



#############################################################################
##############INTERFAZ PRINCIPAL#############################################
#############################################################################

################################RECOGNIZE NAMES#################################
func profile_detect():
	var file = File.new()
	if not file.file_exists("C:/the glicht/" + "slot" + str(performancesext.save_dir_num) + "/" + "profile.rpgdtg"):
		$".".add_child(POP_up_create_name.instance())
	else:
		yield(get_tree().create_timer(0.4),"timeout")
		$Botones/ModoHistoria.grab_focus()
################################################################################



#############################BOTONES PRESS FUNCS########################################
func _on_ModoHistoria_pressed():
	performancesext.get_child(0).animation.play("go-map")
	$Botones/ModoHistoria.release_focus()
	yield(get_tree().create_timer(0.3),"timeout")
	get_tree().change_scene("res://Escenas/Interfaces/Menu/Select_battle_UI.tscn")
	queue_free()

func _on_Personajes_pressed():
	performancesext.get_child(0).animation.play("go-map")
	$Botones/mas.release_focus()
	yield(get_tree().create_timer(0.3),"timeout")
	get_tree().change_scene("res://Escenas/Interfaces/Menu/personajes_obtenidos.tscn")
	queue_free()

func _on_mas_pressed():
	$Botones/mas.release_focus()
	var diag = DIAG.instance()
	diag.set_script(load("res://Escenas/Interfaces/Dialog/Interfaz/dialog_interfaz_1.gd"))
	yield(get_tree().create_timer(0.1),"timeout")
	$".".add_child(diag)

func _on_profile_button_pressed():
	$profile_button.release_focus()
	$".".add_child(POP_up_profile.instance())


func _on_Logros_pressed():
	$".".add_child(LOGROS_pop_up.instance())

func _on_Opciones_pressed():
	$".".add_child(OPTIONS_pop_up.instance())

func _on_Stats_pressed():
	$".".add_child(STATS_pop_uo.instance())
##############################################################################


############################FOCUS BOTONES#####################################
func _on_ModoHistoria_focus_entered():
	$Botones/ModoHistoria/animfoc.play("focus")
func _on_ModoHistoria_focus_exited():
	$Botones/ModoHistoria/animfoc.play_backwards("focus")

func _on_Personajes_focus_entered():
	$Botones/Personajes/animfoc.play("focus")
func _on_Personajes_focus_exited():
	$Botones/Personajes/animfoc.play_backwards("focus")

func _on_mas_focus_entered():
	$Botones/mas/animfoc.play("focus")
func _on_mas_focus_exited():
	$Botones/mas/animfoc.play_backwards("focus")

func _on_profile_button_focus_entered():
	$profile_button/anim.play("focus")
func _on_profile_button_focus_exited():
	$profile_button/anim.play_backwards("focus")

func _on_Logros_focus_entered():
	$botones_chiquitos/Logros/focusanim.play("focus")
func _on_Logros_focus_exited():
	$botones_chiquitos/Logros/focusanim.play_backwards("focus")

func _on_Opciones_focus_entered():
	$botones_chiquitos/Opciones/focusanim.play("focus")
func _on_Opciones_focus_exited():
	$botones_chiquitos/Opciones/focusanim.play_backwards("focus")

func _on_Stats_focus_entered():
	$botones_chiquitos/Stats/focusanim.play("focus")
func _on_Stats_focus_exited():
	$botones_chiquitos/Stats/focusanim.play_backwards("focus")

func _on_Musics_focus_entered():
	$botones_chiquitos/Musics/focusanim.play("focus")
func _on_Musics_focus_exited():
	$botones_chiquitos/Musics/focusanim.play_backwards("focus")
############################################################################

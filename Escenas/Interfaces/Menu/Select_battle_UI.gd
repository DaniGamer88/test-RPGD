extends CanvasLayer

const POP_UP_select_level = preload("res://Escenas/Interfaces/PopUPS/menu/pop_up_select_level.tscn")


export (bool) var X = false

onready var bttn_bat_1 = $Isla1/battle1

func _ready():
	yield(get_tree().create_timer(0.8),"timeout")
	$Isla1/battle1.grab_focus()
	X = true

func _process(delta):
	detect_history_unlock()
	quit()



##########################FUNCIONES DE INTERFAZ#####################################################
func quit():
	if X and Input.is_action_just_pressed("ui_select"):
		X = false
		performancesext.get_child(0).animation.play("go-map")
		yield(get_tree().create_timer(0.3),"timeout")
		get_tree().change_scene("res://Escenas/Interfaces/Menu/Interfaz.tscn")
		queue_free()


func detect_history_unlock():
	if performancesext.history == 1:
		$Isla1/battle1.disabled = false
		$Isla1/battle2.disabled = true
		$Isla1/battle3.disabled = true
		$Isla1/battle4.disabled = true
		$Isla1/battle5.disabled = true
	
	elif performancesext.history == 2:
		$Isla1/battle1.disabled = false
		$Isla1/battle2.disabled = false
		$Isla1/battle3.disabled = true
		$Isla1/battle4.disabled = true
		$Isla1/battle5.disabled = true
	
	elif performancesext.history == 3:
		$Isla1/battle1.disabled = false
		$Isla1/battle2.disabled = false
		$Isla1/battle3.disabled = false
		$Isla1/battle4.disabled = true
		$Isla1/battle5.disabled = true
	
	elif performancesext.history == 4:
		$Isla1/battle1.disabled = false
		$Isla1/battle2.disabled = false
		$Isla1/battle3.disabled = false
		$Isla1/battle4.disabled = false
		$Isla1/battle5.disabled = true
	
	elif performancesext.history == 5:
		$Isla1/battle1.disabled = false
		$Isla1/battle2.disabled = false
		$Isla1/battle3.disabled = false
		$Isla1/battle4.disabled = false
		$Isla1/battle5.disabled = false
####################################################################################################


#################################BUTTONS PRESSED####################################################
func _on_battle1_pressed():
	X = false
	$".".add_child(POP_UP_select_level.instance())
	$Isla1/battle1.release_focus()

func _on_battle2_pressed():
	X = false
	$".".add_child(POP_UP_select_level.instance())
	$Isla1/battle2.release_focus()

func _on_battle3_pressed():
	X = false
	$".".add_child(POP_UP_select_level.instance())
	$Isla1/battle3.release_focus()

func _on_battle4_pressed():
	X = false
	$".".add_child(POP_UP_select_level.instance())
	$Isla1/battle4.release_focus()

func _on_battle5_pressed():
	X = false
	$".".add_child(POP_UP_select_level.instance())
	$Isla1/battle5.release_focus()
####################################################################################################


############################FOCUS BUTTONS###########################################################
func _on_battle1_focus_entered():
	performancesext.focus_hist = 1

func _on_battle2_focus_entered():
	performancesext.focus_hist = 2

func _on_battle3_focus_entered():
	performancesext.focus_hist = 3

func _on_battle4_focus_entered():
	performancesext.focus_hist = 4

func _on_battle5_focus_entered():
	performancesext.focus_hist = 5
####################################################################################################

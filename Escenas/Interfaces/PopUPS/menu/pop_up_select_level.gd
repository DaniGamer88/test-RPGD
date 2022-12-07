extends CanvasLayer

const POP_UP_info = preload("res://Escenas/Interfaces/PopUPS/info/pop_up_info_level.tscn")

export (bool) var X = false

onready var bttn_info = $option/info

func _ready():
	yield(get_tree().create_timer(0.4),"timeout")
	$option/continue.grab_focus()

func _process(delta):
	$option/progreso/percent.value = $option/progreso.value
	quit()
	check_battle_info()

func quit():
	if X and Input.is_action_just_pressed("ui_select"):
		get_parent().X = true
		get_parent().bttn_bat_1.grab_focus()
		queue_free()


#########################FOCUS##################################################
func _on_continue_focus_entered():
	$option/continue/anim.play("focus")
func _on_continue_focus_exited():
	$option/continue/anim.play_backwards("focus")

func _on_info_focus_entered():
	$option/info/anim.play("focus")
func _on_info_focus_exited():
	$option/info/anim.play_backwards("focus")
################################################################################

######################PREESED BUTTONS###########################################
func _on_info_pressed():
	$".".add_child(POP_UP_info.instance())
	$option/info.release_focus()
	X = false

func _on_continue_pressed():
	if performancesext.focus_hist == 1:
		performancesext.get_child(0).animation.play("go-map")
		$option/continue.release_focus()
		performancesext.AudioMusic.play_mu()
		performancesext.AudioMusic.stream = load("")
		yield(get_tree().create_timer(0.3),"timeout")
		get_tree().change_scene("res://Escenas/Mapas/Map1/zone1_1.tscn")
		queue_free()
################################################################################

########################CHECK IF IS TRUE########################################
func check_battle_info():
	
	if performancesext.focus_hist == 1:
		$option/tittle.text = str(performancesext.battle_1["name"])
		$option/progreso.value = performancesext.battle_1["porcent"]
	
	elif performancesext.focus_hist == 2:
		$option/tittle.text = str(performancesext.battle_2["name"])
		$option/progreso.value = performancesext.battle_2["porcent"]
################################################################################

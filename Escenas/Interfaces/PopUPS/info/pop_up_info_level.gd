extends CanvasLayer

export (bool) var X = true

func _process(delta):
	quit()
	check_battle_info()


func quit():
	if X and Input.is_action_just_pressed("ui_select") or Input.is_action_just_pressed("ui_accept"):
		get_parent().X = true
		get_parent().bttn_info.grab_focus()
		queue_free()


###############################CHECK IF IS TRUE#####################################################
func check_battle_info():
	
	if performancesext.focus_hist == 1:
		$Control/nivel_tittle.text = str(performancesext.battle_1["name"])
		$Control/text_attemps/number.text = str(performancesext.battle_1["intentos"])
		$Control/text_progrees/porcent.value = performancesext.battle_1["porcent"]
####################################################################################################

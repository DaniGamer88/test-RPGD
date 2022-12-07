extends CanvasLayer

export (bool) var X = false


func _ready():
	yield(get_tree().create_timer(0.2),"timeout")
	$option/bgm.grab_focus()


func _process(delta):
	check_volume()
	
	if X and Input.is_action_just_pressed("ui_select"):
		get_parent().X = true
		get_parent().bttn_vol.grab_focus()
		queue_free()


############################PRESSED BUTTONS#####################################
func _on_bgm_pressed():
	performancesext.ops["VOLUMEN"] += 10

func _on_sfx_pressed():
	performancesext.ops["SFX"] += 10
################################################################################


#############################FOCUS BUTTONS######################################
func _on_bgm_focus_entered():
	$option/bgm/anim_foc.play("focus")
func _on_bgm_focus_exited():
	$option/bgm/anim_foc.play_backwards("focus")


func _on_sfx_focus_entered():
	$option/sfx/anim_foc.play("focus")
func _on_sfx_focus_exited():
	$option/sfx/anim_foc.play_backwards("focus")
################################################################################


######################CHECK IF IS TRUE##########################################
func check_volume():
	$option/bgm_bar.value = performancesext.ops["VOLUMEN"]
	$option/sfx_bar.value = performancesext.ops["SFX"]
	
	$option/bgm_bar/porcent.value = $option/bgm_bar.value
	$option/sfx_bar/porcent.value = $option/sfx_bar.value
################################################################################

extends CanvasLayer

export (bool) var X = false

func _ready():
	yield(get_tree().create_timer(0.2),"timeout")
	$option/button1/Button.grab_focus()

func _process(delta):
	check_options()
	
	if X and Input.is_action_just_pressed("ui_select"):
		get_parent().X = true
		get_parent().bttn_video.grab_focus()
		queue_free()



#################################PRESSED BUTTONS################################
func _on_Button1_pressed():
	performancesext.ops["Resolution"] += 0.1
	yield(get_tree().create_timer(0.1),"timeout")
	OS.center_window()

func _on_Button2_pressed():
	performancesext.ops["FS"] += 0.1

func _on_Button3_pressed():
	performancesext.ops["LDM"] += 0.1

func _on_Button4_pressed():
	performancesext.ops["vsync"] += 0.1
################################################################################


#############################FOCUS##############################################
func _on_Button1_focus_entered():
	$option/button1/focus.play("foc")
func _on_Button1_focus_exited():
	$option/button1/focus.play_backwards("foc")

func _on_Button2_focus_entered():
	$option/button2/focus.play("foc")
func _on_Button2_focus_exited():
	$option/button2/focus.play_backwards("foc")

func _on_Button3_focus_entered():
	$option/button3/focus.play("foc")
func _on_Button3_focus_exited():
	$option/button3/focus.play_backwards("foc")

func _on_Button4_focus_entered():
	$option/button4/focus.play("foc")
func _on_Button4_focus_exited():
	$option/button4/focus.play_backwards("foc")
################################################################################


######################CHECK IF IS TRUE##########################################
func check_options():
	$option/button1/Button.text = str(OS.window_size.x) + "x" + str(OS.window_size.y)
	
	if performancesext.ops["FS"] == 0.1:
		$option/button1/Button.disabled = true
		$option/button2/Button.text = "Si"
	else:
		$option/button1/Button.disabled = false
		$option/button2/Button.text = "No"
	
	if performancesext.ops["LDM"] == 0.1:
		$option/button3/Button.text = "Si"
	else:
		$option/button3/Button.text = "No"
	
	if performancesext.ops["vsync"] == 0.1:
		$option/button4/Button.text = "Si"
	else:
		$option/button4/Button.text = "No"
################################################################################

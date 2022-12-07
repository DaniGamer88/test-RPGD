extends CanvasLayer

export (bool) var X = false

func _ready():
	yield(get_tree().create_timer(0.4),"timeout")
	$option/change_name.grab_focus()

func _process(delta):
	get_info()
	quit()

func quit():
	if X and Input.is_action_just_pressed("ui_select"):
		get_parent().X = true
		get_parent().bttn_profile.grab_focus()
		queue_free()

###############################PRESSED BUTTONS##################################

func _on_change_name_pressed():
	queue_free()
	get_parent().add_child(get_parent().POP_up_create_name.instance())
################################################################################

#############################CHECK IF THE INFO IS TRUE##########################
func get_info():
	$option/tittle.text = str(performancesext.user_name)
################################################################################

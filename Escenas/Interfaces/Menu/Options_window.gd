extends CanvasLayer


export (bool) var X = true

onready var bttn_video = $options/BttnsScroll/container/Quality
onready var bttn_counter = $options/BttnsScroll/container/change_counter
onready var bttn_vol = $options/BttnsScroll/container/bgm

func _ready():
	$options/BttnsScroll/container/bgm.grab_focus()

func _process(delta):
	
	if X and Input.is_action_just_pressed("ui_select"):
		$animacion.play_backwards("appear")
		performancesext.save_configuration()
		yield(get_tree().create_timer(0.3),"timeout")
		get_parent().bttn_op.grab_focus()
		queue_free()



#############################BOTONES FOCUS################################################################
##########################################################################################################

#################################PRESSED BUTTONS####################################################
func _on_bgm_pressed():
	X = false
	$options/BttnsScroll/container/bgm.release_focus()
	$options/BttnsScroll/container/bgm/button/anim.play("press")
	$".".add_child(preload("res://Escenas/Interfaces/PopUPS/opciones/pop_up_options_volume.tscn").instance())

func _on_Quality_pressed():
	X = false
	$options/BttnsScroll/container/Quality.release_focus()
	$options/BttnsScroll/container/Quality/button/anim.play("press")
	$".".add_child(preload("res://Escenas/Interfaces/PopUPS/opciones/pop_up_options_video.tscn").instance())

func _on_change_counter_pressed():
	$options/BttnsScroll/container/change_counter/button/anim.play("press")
	$options/BttnsScroll/container/change_counter.release_focus()
	X = false
	$".".add_child(preload("res://Escenas/Interfaces/PopUPS/opciones/pop_up_options_counter_change.tscn").instance())
####################################################################################################




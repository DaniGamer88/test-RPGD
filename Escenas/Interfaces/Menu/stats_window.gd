extends CanvasLayer

export (bool) var X = true

func _ready():
	$window/BttnsScroll/container/stat1.grab_focus()


func _process(delta):
	stats_detect()
	
	if X and Input.is_action_just_pressed("ui_select"):
		$animacion.play_backwards("appear")
		yield(get_tree().create_timer(0.3),"timeout")
		get_parent().bttn_stats.grab_focus()
		queue_free()


####################################STATS###########################################################
func stats_detect():
	#$window/BttnsScroll/container/stat1/text2.text = str(performancesext.stats["saltos"])
	$window/BttnsScroll/container/stat2/text2.text = str(performancesext.battle_1["intentos"] + performancesext.battle_2["intentos"])
	$window/BttnsScroll/container/stat4/text2.text = str(performancesext.history)
####################################################################################################




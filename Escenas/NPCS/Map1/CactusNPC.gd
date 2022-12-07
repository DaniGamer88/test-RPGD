extends Area2D

const Dialogo = preload("res://Escenas/Interfaces/Dialog/dialog_solo.tscn")

var press = false

func _process(delta):
	dialog()

#######################################Cuando sea tocado por el jugador#############################
func _on_CactusNPC_body_entered(body):
	if body.is_in_group("PLAYER"):
		press = true
		$anim_enter.play("entered")

func _on_CactusNPC_body_exited(body):
	if body.is_in_group("PLAYER"):
		press = false
		$anim_enter.play_backwards("entered")

func dialog():
	if press and Input.is_action_just_pressed("ui_accept"):
		var diag = Dialogo.instance()
		
		if performancesext.battle_1["npc_cactus"] == 0:
			diag.set_script(load("res://Escenas/Interfaces/Dialog/npcs/dialog_cactus.gd"))
		elif performancesext.battle_1["npc_cactus"] == 1:
			diag.set_script(load("res://Escenas/Interfaces/Dialog/npcs/dialog_cactus_2.gd"))
		elif performancesext.battle_1["npc_cactus"] == 2:
			diag.set_script(load("res://Escenas/Interfaces/Dialog/npcs/dialog_cactus_3.gd"))
		elif performancesext.battle_1["npc_cactus"] >= 2:
			diag.set_script(load("res://Escenas/Interfaces/Dialog/npcs/dialog_cactus_4.gd"))
		
		yield(get_tree().create_timer(0.1),"timeout")
		$".".add_child(diag)
		performancesext.battle_1["npc_cactus"] += 1
####################################################################################################

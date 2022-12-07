extends KinematicBody2D


const PAUSA_INTERFAZ = preload("res://Escenas/Interfaces/Pausa/Interfaz_pausa.tscn")

########################VARIABLES DE MOVIMIENTO#################################
var move = Vector2()
var vel_alta = 27000
var vel_normal = 16000
var vel_lento = 5000
var Speed = 0
################################################################################

#####################BOOLS DE MOVIMIENTO########################################
export (bool) var UP = true
export (bool) var DOWN = true
export (bool) var LEFT = true
export (bool) var RIGHT = true
export (bool) var ESC = true
export (bool) var C = true
################################################################################


########################VARIABLES DE DATOS######################################

var data = {
	"name" : "4dominic888",
	"info" : "a",
	"money" : 0,
	"estado" : 0,
	"VIDA" : 1,
	"VIDA_MAX" : 5,
	"ATQ" : 0,
	"DEF" : 0,
	"VEL" : 0,
	"TP" : 0,
	"unlock" : 0,
}

var objs = {
	"obj_1" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
	
	"obj_2" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
	
	"obj_3" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
	
	"obj_4" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
	
	"obj_5" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
	
	"obj_6" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
	
	"obj_7" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
	
	"obj_8" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
	
	"obj_9" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
	
	"obj_10" : {
		"NAME" : "",
		"INFO" : "",
		"HEALS" : 0,
		"TYPE" : 0,
		"VACIO" : true
	},
}
################################################################################


func _process(delta):
	data_player()


#################################FISICA DEL JUGADOR#################################################
func _physics_process(delta):
	move = Vector2(0,0)
	
	
	var script = $".".get_script().new()
	script.pause_mode = Node.PAUSE_MODE_PROCESS
	
	
	
	if RIGHT and Input.is_action_pressed("ui_right"):
		move.x = 400
		$AnimatedSprite.play("lado")
		$AnimatedSprite.flip_h = false
	if LEFT and Input.is_action_pressed("ui_left"):
		move.x = -400
		$AnimatedSprite.play("lado")
		$AnimatedSprite.flip_h = true
	if UP and Input.is_action_pressed("ui_up"):
		move.y = -400
		$AnimatedSprite.play("arriba")
	if DOWN and Input.is_action_pressed("ui_down"):
		move.y = 400
		$AnimatedSprite.play("abajo")
	
	move = move.normalized()
	
	if Input.is_action_pressed("ui_accept"):
		Speed = vel_lento
	elif Input.is_action_pressed("ui_select"):
		Speed = vel_alta
	else:
		Speed = vel_normal
	
	
	move = move_and_slide(move * Speed * delta)
	
	if C and Input.is_action_just_pressed("C"):
		$".".add_child(PAUSA_INTERFAZ.instance())



func _on_Hurtbox_area_entered(area):  #####CUANDO ES LASTIMADO
	if area.is_in_group("BOSS_ATQ"):
		pass
		#Vida -= area.hurt
		#area.hurt -= Defensa
	else:
		pass
####################################################################################################


###################################DATOS DEL JUGADOR################################################
func data_player():
	#LIFE
	if data["VIDA"] >= data["VIDA_MAX"]:
		data["VIDA"] = data["VIDA_MAX"]
	
	if data["VIDA"] <= 0:
		data["VIDA"] = 0
	
	
	#OBJS
	if objs["obj_1"]["VACIO"] == true:
		objs["obj_1"]["HEALS"] = 0
		objs["obj_1"]["INFO"] = ""
		objs["obj_1"]["NAME"] = ""
		objs["obj_1"]["TYPE"] = 0
####################################################################################################

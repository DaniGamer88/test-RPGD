extends CanvasLayer

var path_dialgs = "res://Escenas/Interfaces/Dialog/dialogos"

var dialog_text = 1
var PRESS = false
var random_anima
var next_indicator = false

onready var text_name = $coso/name_text
onready var text_diag = $coso/text_dialog
onready var next_img = $coso/next
onready var image_face = $coso/character_ico

#################################CUANDO COMIENZE Y FINALIZE LA ANIMACION DE APARICION###############
func _ready():
	get_tree().paused = true
	random_anim()

func random_anim(): #animacion de aparicion (seleccionador)
	var random_anim = RandomNumberGenerator.new()
	random_anim.randomize()
	random_anima = random_anim.randi_range(1,3)
	
	if random_anima == 1:
		$coso/anim.play("appear1")
	elif random_anima == 2:
		$coso/anim.play("appear2")
	elif random_anima == 3:
		$coso/anim.play("appear3")

func _on_anim_animation_finished(anim_name):
	$coso/anim_txt.play("playin")
####################################################################################################



##############################FUNCION DE SISTEMA DE DIALOGO#########################################
func _process(delta):
	next()
	dialog_main()
	skip()

func _on_anim_txt_animation_finished(anim_name):
	PRESS = true



func skip():
	if Input.is_action_just_pressed("ui_select"):
		$coso/anim_txt.playback_speed = 5
	elif Input.is_action_just_released("ui_select"):
		$coso/anim_txt.playback_speed = 1



func next():
	if PRESS and Input.is_action_just_pressed("ui_accept"):
		dialog_text += 1
		$coso/text_dialog.percent_visible = 0
		$coso/anim_txt.play("playin")
		PRESS = false
	
	if next_indicator == true:
		next_img.texture = load("res://Main Resources/Sprites/Interfaz/DialogUI/indicador_next.png")
	else:
		next_img.texture = load("res://Main Resources/Sprites/Interfaz/DialogUI/39 sin título_20220724100706.png")



func dialog_main():
	pass
	
	#get_parent().bttn_mas.grab_focus()
	#get_tree().paused = false
	#queue_free()
####################################################################################################

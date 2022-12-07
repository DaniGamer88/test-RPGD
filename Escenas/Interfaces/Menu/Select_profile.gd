extends CanvasLayer

export (bool) var X = false

signal selected


func _ready():
	$options/BttnsScroll/Profile1.grab_focus()

func _process(delta):
	detect_slot_1()
	detect_slot_2()
	detect_slot_3()


##############################FOCUS BUTTONS#########################################################
func _on_Profile1_focus_entered():
	performancesext.save_dir_num = 1
	$options/BttnsScroll/Profile1/anim.play("focus")
func _on_Profile1_focus_exited():
	$options/BttnsScroll/Profile1/anim.play_backwards("focus")


func _on_Profile2_focus_entered():
	performancesext.save_dir_num = 2
	$options/BttnsScroll/Profile2/anim.play("focus")
func _on_Profile2_focus_exited():
	$options/BttnsScroll/Profile2/anim.play_backwards("focus")


func _on_Profile3_focus_entered():
	performancesext.save_dir_num = 3
	$options/BttnsScroll/Profile3/anim.play("focus")
func _on_Profile3_focus_exited():
	$options/BttnsScroll/Profile3/anim.play_backwards("focus")
####################################################################################################



##########################PRESSED BUTTONS###########################################################
func _on_Profile1_pressed():
	create_game_dir()
	$options/BttnsScroll/Profile1.release_focus()

func _on_Profile2_pressed():
	create_game_dir()
	$options/BttnsScroll/Profile2.release_focus()

func _on_Profile3_pressed():
	create_game_dir()
	$options/BttnsScroll/Profile3.release_focus()
####################################################################################################




########################FUNCIONES DE CREAR Y BORRAR JUEGO Y DETECTAR ARCHIVOS#######################
func detect_slot_1():
	var file_profi = File.new()
	file_profi.open("C:/the glicht/" + "slot" + str(1) + "/" + "profile.rpgdtg", File.READ)
	
	if file_profi.file_exists("C:/the glicht/" + "slot" + str(1) + "/" + "profile.rpgdtg"):
		$options/BttnsScroll/Profile1/name.text = str(file_profi.get_var())
	else:
		$options/BttnsScroll/Profile1/name.text = "..."
	
	file_profi.close()

func detect_slot_2():
	var file_profi = File.new()
	file_profi.open("C:/the glicht/" + "slot" + str(2) + "/" + "profile.rpgdtg", File.READ)
	
	if file_profi.file_exists("C:/the glicht/" + "slot" + str(2) + "/" + "profile.rpgdtg"):
		$options/BttnsScroll/Profile2/name.text = str(file_profi.get_var())
	else:
		$options/BttnsScroll/Profile2/name.text = "..."
	
	file_profi.close()

func detect_slot_3():
	var file_profi = File.new()
	file_profi.open("C:/the glicht/" + "slot" + str(3) + "/" + "profile.rpgdtg", File.READ)
	
	if file_profi.file_exists("C:/the glicht/" + "slot" + str(3) + "/" + "profile.rpgdtg"):
		$options/BttnsScroll/Profile3/name.text = str(file_profi.get_var())
	else:
		$options/BttnsScroll/Profile3/name.text = "..."
	
	file_profi.close()


func create_game_dir():
	var Dir_game = Directory.new()
	Dir_game.open("C:/the glicht")
	Dir_game.make_dir("slot" + str(performancesext.save_dir_num))
	
	performancesext.Transicion.animation.play("go-map")
	performancesext.AudioMusic.play_mu()
	performancesext.AudioMusic.stream = load("res://Main Resources/Sonidos/Interfaz/menuLoop.mp3")
	performancesext.AudioMusic.texto.text = "menuLoop but it's Megalovania / Mudstep"
	yield(get_tree().create_timer(0.3),"timeout")
	performancesext.AudioMusic.text_info_mus()
	performancesext.load_profile()
	get_tree().change_scene("res://Escenas/Interfaces/Menu/Interfaz.tscn")
	get_parent().queue_free()
####################################################################################################

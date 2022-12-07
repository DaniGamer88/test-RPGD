extends Node


######################################CONSTANTES HIJOS##############################################
const quit_timer = preload("res://Escenas/Interfaces/Menu/timerquit.tscn")
const transiciones = preload("res://Escenas/Interfaces/Transiciones/TransicionBattle.tscn")
####################################################################################################


onready var Transicion = $TransicionBattle
onready var AudioMusic = $AudioMusicPrincipal


var save_dir_num = 1
var time_game = Timer.new()

var user_name = ""

var history = 1


var focus_hist = 1







####################################VARIABLES DE LOGROS#############################################
var logros = {
	"logro_1" : {
		"name" : "Dominic vs Exbor",
		"info" : "Completa el nivel 'Dominic vs Exbor'.",
		"porcent" : 0
	},
	
	"logro_2" : {
		"name" : "Lenny vs... Mech?",
		"info" : "Completa el nivel 'Lenny vs...Mech?'.",
		"porcent" : 0
	}
}
####################################################################################################




##################################VARIABLES STATS###################################################
var stats = {
	"saltos" : 0
}

var characters_unlock = {
	"dominic" : 0.0,
}
####################################################################################################





#####################################VARIABLES DE LAS OPCIONES######################################
var ops = {
	"VOLUMEN" : 0,
	"SFX" : 0,
	
	
	"Resolution" : 0.0,
	"LDM" : 0.0,
	"FS" : 0.0,
	"vsync" : 0.0,
	
	
	"hurt_counter_style" : 0.4
}
####################################################################################################






func _ready():
	crear_carpeta_principal()
	load_configuration()
	
	var dir = Directory.new()
	dir.open("C:/the glicht")
	
	print(dir.get_current_dir().get_file())
	
	$".".pause_mode = Node.PAUSE_MODE_PROCESS


func _process(delta):
	volume()
	full_screen()
	Vsync_func()
	LOW_DETAIL_MODE()
	resolution()
	
	if save_dir_num == 4:
		save_dir_num = 1










####################################################################################################
######################################OPCIONES DEL JUEGO############################################
####################################################################################################
func volume():
	if ops.VOLUMEN > 0:
		ops.VOLUMEN = -80
	
	if ops.SFX > 0:
		ops.SFX = -80
	
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),ops.VOLUMEN)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),ops.SFX)


#video
func LOW_DETAIL_MODE():
	if ops["LDM"] > 0.1:
		ops["LDM"] = 0.0

func Vsync_func():
	if ops["vsync"] == 0.1:
		OS.vsync_enabled = true
	else:
		OS.vsync_enabled = false
	
	if ops["vsync"] == 0.2:
		ops["vsync"] = 0.0

func resolution():
	if ops["Resolution"] == 0.0:
		OS.window_size = Vector2(1024, 600)
	elif ops["Resolution"] == 0.1:
		OS.window_size = Vector2(1176, 664)
	elif ops["Resolution"] == 0.2:
		OS.window_size = Vector2(800, 500)
	
	
	if ops["Resolution"] >= 0.3:
		ops["Resolution"] = 0.0
	

func full_screen():
	if ops["FS"] == 0.0:
		OS.window_fullscreen = false
	elif ops["FS"] == 0.1:
		OS.window_fullscreen = true
	
	if ops.FS > 0.1:
		ops.FS = 0.0
####################################################################################################
####################################################################################################
####################################################################################################
















####################################################################################################
#####################################JUEGO PRINCIPAL################################################
####################################################################################################

######################################ESTADOS DE MAPAS##############################################

######################BATALLA 1#################################################
var battle_1 = {
	"name" : "Dominic vs Exbor",
	
	"npc_cactus" : 0,
	
	"intentos" : 0,
	"porcent" : 0
}
################################################################################

######################BATALLA 2#################################################
var battle_2 = {
	"name" : "Lenny vs... Mech?",
	
	"intentos" : 0,
	"porcent" : 0
}
################################################################################

######################BATALLA 3#################################################
var battle_3 = {
	"porcent" : 0
}
################################################################################

######################BATALLA 4#################################################
var battle_4 = {
	"porcent" : 0
}
################################################################################

######################BATALLA 5#################################################
var battle_5 = {
	"porcent" : 0
}
################################################################################

######################BATALLA 6#################################################
var battle_6 = {
	"porcent" : 0
}
################################################################################

######################BATALLA 7#################################################
var battle_7 = {
	"porcent" : 0
}
################################################################################

######################BATALLA 8#################################################
var battle_8 = {
	"porcent" : 0
}
################################################################################

######################BATALLA 9#################################################
var battle_9 = {
	"porcent" : 0
}
################################################################################

######################BATALLA 10#################################################
var battle_10 = {
	"porcent" : 0
}
################################################################################

####################################################################################################

####################################################################################################
####################################################################################################
####################################################################################################

















####################################################################################################
##########################FUNCIONES DE GUARDADO: config, directorio, etc############################
####################################################################################################


##################################CREACION DE DIRECTORIO############################################
func crear_carpeta_principal():
	var dir = Directory.new()
	if !dir.dir_exists("C:/the glicht"):
		dir.open("C:/")
		dir.make_dir("the glicht")
####################################################################################################


#################################STATS, LOGROS, PERFIL, ETC#########################################
func save_profile():
	var file_profi = File.new()
	file_profi.open("C:/the glicht/" + "slot" + str(save_dir_num) + "/" + "profile.rpgdtg", File.WRITE)
	$SING_SAVING/sign_save/anim.play("save")
	
	file_profi.store_var(user_name)
	file_profi.store_var(stats)
	
	file_profi.store_var(logros)
	
	file_profi.store_var(battle_1)
	file_profi.store_var(battle_2)
	file_profi.store_var(battle_3)
	file_profi.store_var(battle_4)
	file_profi.store_var(battle_5)
	file_profi.store_var(battle_6)
	file_profi.store_var(battle_7)
	file_profi.store_var(battle_8)
	file_profi.store_var(battle_9)
	file_profi.store_var(battle_10)
	
	file_profi.close()

func load_profile():
	var file_profi = File.new()
	file_profi.open("C:/the glicht/" + "slot" + str(save_dir_num) + "/" + "profile.rpgdtg", File.READ)
	if not file_profi.file_exists("C:/the glicht/" + "slot" + str(save_dir_num) + "/" + "profile.rpgdtg"):
		return null
	
	user_name = file_profi.get_var()
	stats = file_profi.get_var()
	
	logros = file_profi.get_var()
	
	battle_1 = file_profi.get_var()
	battle_2 = file_profi.get_var()
	battle_3 = file_profi.get_var()
	battle_4 = file_profi.get_var()
	battle_5 = file_profi.get_var()
	battle_6 = file_profi.get_var()
	battle_7 = file_profi.get_var()
	battle_8 = file_profi.get_var()
	battle_9 = file_profi.get_var()
	battle_10 = file_profi.get_var()
	
	file_profi.close()
####################################################################################################


######################################CONFIGURACION#################################################
func save_configuration():
	var file = File.new()
	file.open("C:/the glicht/configuration.ini", File.WRITE)
	$SING_SAVING/sign_save/anim.play("save")
	
	
	file.store_var(ops)
	file.close()

func load_configuration():
	var file = File.new()
	file.open("C:/the glicht/configuration.ini", File.READ)
	if !file.file_exists("C:/the glicht/configuration.ini"):
		return null
	
	ops = file.get_var()
	file.close()
####################################################################################################


####################################################################################################
####################################################################################################
####################################################################################################

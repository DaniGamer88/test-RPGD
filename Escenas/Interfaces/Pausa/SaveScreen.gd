extends CanvasLayer

var Time
var Nivel
var nombre


func _ready():
	yield(get_tree().create_timer(0.1),"timeout")
	$Regresarbttn.grab_focus()
	$textSaveComplete.visible = false
	
	
	$Hora.text = str(Time)
	$Nivel.text = str(Nivel)
	$name.text = str(nombre)

####################################SISTEMA DE BOTONES############################################
func _on_SaveButton_focus_entered():
	pass

func _on_Regresarbttn_focus_entered():
	pass



func _on_SaveButton_pressed():
	pass

func _on_Regresarbttn_pressed():
	$Appearanim.play_backwards("apear")
	yield(get_tree().create_timer(0.2),"timeout")
	queue_free()
	get_tree().paused = false

##################################################################################################


func _process(delta):
	optimizacion()

######################SISTEMA DE OPTIMIZACION####################################################
func optimizacion():
	if performancesext.ops["LDM"] == 0.1:
		$background2.hide()
	else:
		$background2.show()
#################################################################################################


#####################################SISTEMA DE HORA##############################################
func get_time(time):
	var meridiem = "AM"
	var hour = time.hour
	
	if hour > 12:
		meridiem = "PM"
		hour -= 12
	
	var minute = "%02d" % time.minute
	var time_return = str(hour) + ":" + str(minute) + str(meridiem)
	return time_return

func get_date(date):
	var month = date.month
	var day = date.day
	var year = date.year
	date = str(day) + "/" + str(month) + "/" +str(year)
	return date


##################################################################################################


###########################################SISTEMA DE GUARDADO#####################################
func _save_game():
	var datetime = OS.get_datetime()
	$Hora.text = "Ultima vez: " + get_time(datetime) + " el " + get_date(datetime)
	#$Nivel.text = "Nivel " + str(Inventario.Nivel)
	Time = str($Hora.text)
	Nivel = str($Nivel.text)
	#Inventario.save_stadistics()
	#MapsStates.save_state()
	
	#File_game.store_var(Time)
	#File_game.store_var(Nivel)
###################################################################################################

extends CanvasLayer

export (bool) var X = false
onready var line = $Linetext

func _ready():
	$Teclado/teclaAmayus.grab_focus()

func _process(delta):
	recognize_names()
	performancesext.user_name = str($Linetext.text)

func recognize_names():
	if $Linetext.text == "Dominic":
		$Tittle.text = "road to 888?"
		
	elif $Linetext.text == "Exbor":
		$Tittle.text = "nope"
		
	elif $Linetext.text == "Dani":
		$Tittle.text = "aya c:"
		
	elif $Linetext.text == "Lenny":
		$Tittle.text = "compra agua"
		
	elif $Linetext.text == "Mech":
		$Tittle.text = "c mechas"
		
	elif $Linetext.text == "Nilson":
		$Tittle.text = "Cheetos!!! :3"
		
	elif $Linetext.text == "Luis0":
		$Tittle.text = ""
		
	elif $Linetext.text == "Danix":
		$Tittle.text = ""
		
	elif $Linetext.text == "Alpako25":
		$Tittle.text = "sisa"
		
	elif $Linetext.text == "Alexar17":
		$Tittle.text = "..."
		get_tree().quit()
		
	elif $Linetext.text == "MrC1995":
		$Tittle.text = "pan"
	
	else:
		$Tittle.text = "Elige tu nombre."
	
	
	if $Linetext.text == "":
		$aceptar.disabled = true
		$Teclado/regresar.disabled = true
		$timerdeletetext.stop()
	else:
		$Teclado/regresar.disabled = false
		$aceptar.disabled = false

#######################FUNCION DEL TECLADO######################################
func _on_teclaAmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "A")

func _on_teclaBmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "B")

func _on_teclaCmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "C")

func _on_teclaDmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "D")

func _on_teclaEmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "E")

func _on_teclaFmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "F")

func _on_teclaGmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "G")

func _on_teclaHmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "H")

func _on_teclaImayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "I")

func _on_teclaJmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "J")

func _on_teclaKmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "K")

func _on_teclaLmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "L")

func _on_teclaMmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "M")

func _on_teclaNmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "N")

func _on_teclaOmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "O")

func _on_teclaPmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "P")

func _on_teclaQmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "Q")

func _on_teclaRmayus_pressed():
	line.set_text(line.get_text() + "R")

func _on_teclaSmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "S")

func _on_teclaTmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "T")

func _on_teclaVmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "V")

func _on_teclaXmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "X")

func _on_teclaYmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "Y")

func _on_teclaZmayus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "Z")

func _on_teclaAminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "a")

func _on_teclaBminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "b")

func _on_teclaCminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "c")

func _on_teclaDminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "d")

func _on_teclaEminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "e")

func _on_teclaFminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "f")

func _on_teclaGminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "g")

func _on_teclaHminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "h")

func _on_teclaIminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "i")

func _on_teclaJminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "j")

func _on_teclaKminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "k")

func _on_teclaLminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "l")

func _on_teclaMminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "m")

func _on_teclaNminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "n")

func _on_teclaOminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "o")

func _on_teclaPminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "p")

func _on_teclaQminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "q")

func _on_teclaRminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "r")

func _on_teclaSminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "s")

func _on_teclaTminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "t")

func _on_teclaVminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "v")

func _on_teclaXminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "x")

func _on_teclaYminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "y")

func _on_teclaZminus_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "z")

func _on_tecla0num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "0")

func _on_tecla1num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "1")

func _on_tecla2num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "2")

func _on_tecla3num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "3")

func _on_tecla4num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "4")

func _on_tecla5num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "5")

func _on_telca6num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "6")

func _on_tecla7num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "7")

func _on_telca8num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "8")

func _on_tecla9num_pressed():
	$textappear.play()
	line.set_text(line.get_text() + "9")

func _on_regresar_pressed():
	var text = []
	for i in line.get_text():
		text.append(i)
	text.remove(text.size() - 1)
	line.set_text("")
	for i in text:
		line.set_text(line.get_text() + i)

func _on_regresar_button_down():
	$timerdeletetext.start()

func _on_regresar_button_up():
	$timerdeletetext.stop()

func _on_timerdeletetext_timeout():
	line.set_text("")

func _on_aceptar_pressed():
	queue_free()
	performancesext.save_profile()
	get_parent().bttn_play.grab_focus()
################################################################################


func _on_aceptar_focus_entered():
	$aceptar/anim.play("focus")

func _on_aceptar_focus_exited():
	$aceptar/anim.play_backwards("focus")

extends CanvasLayer

export (bool) var X = false

func _ready():
	$TextCred.grab_focus()
	get_tree().paused = true


func _process(delta):
	var interfaz = get_parent()
	
	if X and Input.is_action_just_pressed("ui_select"):
		queue_free()
		get_tree().paused = false
		interfaz.opciones.visible = true
		interfaz.opc_bttn.grab_focus()

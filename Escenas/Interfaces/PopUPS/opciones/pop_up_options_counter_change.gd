extends CanvasLayer

const text_hurt_test = preload("res://Escenas/Interfaces/Menu/text_daño_muestra.tscn")

var focus_select_style = 1

export (bool) var X = false

func _ready():
	yield(get_tree().create_timer(0.2),"timeout")
	$option/buttons/contenedor/style1.grab_focus()

func _process(delta):
	check_option()
	
	if X and Input.is_action_just_pressed("ui_select"):
		get_parent().X = true
		get_parent().bttn_counter.grab_focus()
		queue_free()
	
	if Input.is_action_just_pressed("ui_right"):
		$flecha_der/anim.play("prss")
	if Input.is_action_just_pressed("ui_left"):
		$flecha_izq/anim.play("prss")

############################PRESSED BUTTONS#####################################
func _on_style1_pressed():
	$option/buttons/contenedor/style1/button/anim.play("prss")
	performancesext.ops["hurt_counter_style"] = 0.1

func _on_style2_pressed():
	$option/buttons/contenedor/style2/button/anim.play("prss")
	performancesext.ops["hurt_counter_style"] = 0.2

func _on_style3_pressed():
	$option/buttons/contenedor/style3/button/anim.play("prss")
	performancesext.ops["hurt_counter_style"] = 0.3

func _on_style4_pressed():
	$option/buttons/contenedor/style4/button/anim.play("prss")
	performancesext.ops["hurt_counter_style"] = 0.4

func _on_style5_pressed():
	$option/buttons/contenedor/style5/button/anim.play("prss")
	performancesext.ops["hurt_counter_style"] = 0.5
################################################################################



######################CHECK IF IS TRUE##########################################
func check_option():
	if performancesext.ops["hurt_counter_style"] == 0.1:
		$option/buttons/contenedor/style1/button.play("si")
		$option/buttons/contenedor/style2/button.play("no")
		$option/buttons/contenedor/style3/button.play("no")
		$option/buttons/contenedor/style4/button.play("no")
		$option/buttons/contenedor/style5/button.play("no")
		
	elif performancesext.ops["hurt_counter_style"] == 0.2:
		$option/buttons/contenedor/style1/button.play("no")
		$option/buttons/contenedor/style2/button.play("si")
		$option/buttons/contenedor/style3/button.play("no")
		$option/buttons/contenedor/style4/button.play("no")
		$option/buttons/contenedor/style5/button.play("no")
		
	elif performancesext.ops["hurt_counter_style"] == 0.3:
		$option/buttons/contenedor/style1/button.play("no")
		$option/buttons/contenedor/style2/button.play("no")
		$option/buttons/contenedor/style3/button.play("si")
		$option/buttons/contenedor/style4/button.play("no")
		$option/buttons/contenedor/style5/button.play("no")
		
	elif performancesext.ops["hurt_counter_style"] == 0.4:
		$option/buttons/contenedor/style1/button.play("no")
		$option/buttons/contenedor/style2/button.play("no")
		$option/buttons/contenedor/style3/button.play("no")
		$option/buttons/contenedor/style4/button.play("si")
		$option/buttons/contenedor/style5/button.play("no")
		
	elif performancesext.ops["hurt_counter_style"] == 0.5:
		$option/buttons/contenedor/style1/button.play("no")
		$option/buttons/contenedor/style2/button.play("no")
		$option/buttons/contenedor/style3/button.play("no")
		$option/buttons/contenedor/style4/button.play("no")
		$option/buttons/contenedor/style5/button.play("si")
################################################################################



#############################FOCUS##############################################
func _on_style1_focus_entered():
	focus_select_style = 1
	$option/indicador_bttn.play("1")

func _on_style2_focus_entered():
	focus_select_style = 2
	$option/indicador_bttn.play("2")

func _on_style3_focus_entered():
	focus_select_style = 3
	$option/indicador_bttn.play("3")

func _on_style4_focus_entered():
	focus_select_style = 4
	$option/indicador_bttn.play("4")

func _on_style5_focus_entered():
	focus_select_style = 5
	$option/indicador_bttn.play("5")
################################################################################




#########################FUNC TEST TEXT HURT####################################
func _on_timer_text_test_timeout():
	var medidor_Test = text_hurt_test.instance()
	
	$option.add_child(medidor_Test)
	$option/timer_text_test.start()
	
	var number_r = RandomNumberGenerator.new()
	number_r.randomize()
	number_r = number_r.randi_range(1,3)
	
	if number_r == 1:
		medidor_Test.rect_position = Vector2(168,96)
	elif number_r == 2:
		medidor_Test.rect_position = Vector2(192,136)
	elif number_r == 3:
		medidor_Test.rect_position = Vector2(232,112)
################################################################################

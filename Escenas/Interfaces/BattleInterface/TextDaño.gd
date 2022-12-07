extends Control

onready var line = $"TextDaño"

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

func _ready():
	if performancesext.ops["hurt_counter_style"] == 0.1:
		$AnimationPlayer.play("Aparecer")
	elif performancesext.ops["hurt_counter_style"] == 0.2:
		$AnimationPlayer.play("Aparecer2")
	elif performancesext.ops["hurt_counter_style"] == 0.3:
		$AnimationPlayer.play("Aparecer3")
	elif performancesext.ops["hurt_counter_style"] == 0.4:
		$AnimationPlayer.play("Aparecer4")
	elif performancesext.ops["hurt_counter_style"] == 0.5:
		$AnimationPlayer.play("Aparecer5")
	
	
	
	var number_r = RandomNumberGenerator.new()
	number_r.randomize()
	number_r = number_r.randi_range(1,6)
	
	if number_r == 1:
		$"TextDaño".rect_position = Vector2(-40,67)
	elif number_r == 2:
		$"TextDaño".rect_position = Vector2(8, 115)
	elif number_r == 3:
		$"TextDaño".rect_position = Vector2(24,75)
	elif number_r == 4:
		$"TextDaño".rect_position = Vector2(24, 123)
	elif number_r == 5:
		$"TextDaño".rect_position = Vector2(18.5, 0)
	elif number_r == 6:
		$"TextDaño".rect_position = Vector2(18.5, 67)

func _process(delta):
	if $"TextDaño".text == "888":
		queue_free()
		.hide()

extends AudioStreamPlayer

onready var anim_transition = $AnimationPlayer
onready var texto = $text/text

func play_mu():
	anim_transition.play("transicion")

func text_info_mus():
	$text/text/anim.play("appear")

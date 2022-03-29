extends Node2D

func _ready():
	$ParallaxBackground/AnimationPlayer.play("mouse_sai_iniciar")
	$ParallaxBackground/AnimationPlayer.play("mouse_sai_configuracoes")


func _on_Iniciar_mouse_entered():
	$ParallaxBackground/AnimationPlayer.play("mouse_entra_iniciar")


func _on_Iniciar_mouse_exited():
	$ParallaxBackground/AnimationPlayer.play("mouse_sai_iniciar")

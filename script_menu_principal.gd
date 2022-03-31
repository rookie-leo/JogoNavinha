extends Node2D

func _ready():
	$ParallaxBackground/AnimationPlayer.play("mouse_sai_iniciar")
	$ParallaxBackground/AnimationPlayer.play("mouse_sai_configuracoes")


func _on_Iniciar_mouse_entered():
	$ParallaxBackground/AnimationPlayer.play("mouse_entra_iniciar")


func _on_Iniciar_mouse_exited():
	$ParallaxBackground/AnimationPlayer.play("mouse_sai_iniciar")

func _on_Configuracoes_mouse_entered():
	$ParallaxBackground/AnimationPlayer.play("mouse_entra_configuracoes")


func _on_Configuracoes_mouse_exited():
	$ParallaxBackground/AnimationPlayer.play("mouse_sai_configuracoes")


func _on_Configuracoes_gui_input(event):
	if (event is InputEventMouseButton and event.pressed and event.button_index==1):
		get_tree().change_scene("res://cena_tela_de_configuracoes.tscn")



func _on_Iniciar_gui_input(event):
	if (event is InputEventMouseButton and event.pressed and event.button_index==1):
		get_tree().change_scene("res://cena_selecao_de_personagem.tscn")

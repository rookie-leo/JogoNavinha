extends Node2D



func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == 1):
		Global.tipo_personagem = 1
		get_tree().change_scene("res://cena_fase1.tscn")


func _on_Area2D2_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == 1):
		Global.tipo_persongem = 2
		get_tree().change_scene("res://cena_fase1.tscn")

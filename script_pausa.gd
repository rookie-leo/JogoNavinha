extends Node2D

func _ready():
	visible = false
	get_tree().paused = false
	
func _process(delta):
	if (Input.is_action_just_pressed("pausa")):
		get_tree().paused = not get_tree().paused
		visible = not visible



func _on_sons_pressed():
	Global.tocar_sons = $sons.pressed


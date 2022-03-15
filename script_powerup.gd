extends Area2D




func _excluir_powerup():
	queue_free()


func _on_Area2D_body_entered(body):
	if (body.name=="Personagem"):
		Global.tipo_disparo = 2
		queue_free()

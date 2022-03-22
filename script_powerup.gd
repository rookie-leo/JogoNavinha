extends Area2D

var tipoDisparo:int

func _excluir_powerup():
	queue_free()


func _on_Area2D_body_entered(body):
	if (body.name=="Personagem"):
		body.get_node("Timer").start()
		body.tipo_disparo = 2
		queue_free()

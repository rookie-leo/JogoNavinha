extends Area2D

var velocidade = 150
var qtd_vida = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (qtd_vida<=0):
		$AnimationPlayer.play("explodindo")
	else:
		position.y += velocidade * delta


func colide_nave(body):
	body.queue_free()
	
	queue_free()

#Função para eliminar a nave da memória assim q a animação da explosão terminar
func _on_AnimationPlayer_animation_finished(anim_name):
	if (anim_name=="explodindo"):
		Global.qtd_inimigos_mortos += 1
		
		if (Global.qtd_inimigos_mortos==Global.qtd_inimigo_liberar_powerup): #Verifica a quantidade de inimigos mortos para liberar powerup
			#gerando powerup
			var cena_powerup = preload("res://cena_powerup.tscn")
			var objeto_powerup = cena_powerup.instance()
			objeto_powerup.global_position = global_position
			get_tree().root.add_child(objeto_powerup)
			Global.qtd_inimigos_mortos = 0
		#mata o inimigo
		queue_free()

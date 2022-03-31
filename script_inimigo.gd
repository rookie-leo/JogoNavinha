extends Area2D

var velocidade = 150
var qtd_vida = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var fim_tela = get_viewport().size.y
	if (qtd_vida<=0):
		$AnimationPlayer.play("explodindo")
	else:
		position.y += velocidade * delta
		
	if (position.y>fim_tela):
		Global.total_vidas_atual -= Global.Vida_perdida_apos_furo
		queue_free()


func colide_nave(body):
	if (body.name=="Personagem"):
		$CollisionShape2D.set_deferred("disabled", true)
		Global.total_vidas_atual -= Global.vida_perdida_apos_hit
		$AnimationPlayer.play("explodindo")


#Função para eliminar a nave da memória assim q a animação da explosão terminar
func _on_AnimationPlayer_animation_finished(anim_name):
	if (anim_name=="explodindo"):
		Global.qtd_inimigos_mortos += 1
		
		if (Global.qtd_inimigos_mortos==Global.qtd_inimigo_liberar_powerup): #Verifica a quantidade de inimigos mortos para liberar powerup
			#gerando powerup
			var cena_powerup = preload("res://cena_powerup.tscn")
			var objeto_powerup = cena_powerup.instance()
			objeto_powerup.global_position = global_position
			get_tree().root.get_node(".").add_child(objeto_powerup)
			Global.qtd_inimigos_mortos = 0
		
		Global.qtd_pontos_atual += Global.qtd_pontos_por_inimigo
		#mata o inimigo
		queue_free()

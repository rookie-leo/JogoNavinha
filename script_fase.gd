extends Node2D

func _criar_inimigo_timeout():
	#Cria o personagem inimigo
	var cena_inimigo = preload("res://cena_inimigo.tscn")
	var objeto_inimigo = cena_inimigo.instance()
	
	#Posiciona o inimigo
	var larguraJanela = get_viewport().size.x
	var localizacaoX = rand_range(0, larguraJanela)
	var posicao_nave = Vector2(localizacaoX, 0)
	objeto_inimigo.global_position = posicao_nave
	
	#Imprime o inimigo na tela
	get_tree().root.add_child(objeto_inimigo)

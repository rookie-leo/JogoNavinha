extends Node2D

func _ready():
	print_tree() #Mostra a arvore de execução
	
	$ParallaxBackground/ProgressBar.value = Global.total_vida_inicial
	Global.total_vidas_atual = Global.total_vida_inicial
	
func _process(delta):
	$ParallaxBackground/ProgressBar.value = Global.total_vidas_atual
	if (Global.total_vidas_atual<=0):
		get_tree().root.get_node("Fase1/Personagem/Personagem").morrer()

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
	get_tree().root.get_node(".").add_child(objeto_inimigo)


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()

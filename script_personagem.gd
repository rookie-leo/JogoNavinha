extends KinematicBody2D

var tipo_disparo = 1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
var velocidade = 250
func _process(delta):
	#Movimentacao da nave	
	if (Input.is_action_pressed("paraCima")): 
		global_position.y -= (velocidade * delta) #cima
		
	elif (Input.is_action_pressed("paraBaixo")):
		global_position.y += (velocidade * delta) #baixo
		
	if (Input.is_action_pressed("paraEsquerda")):
		global_position.x -= (velocidade * delta) #esquerda
		
	elif (Input.is_action_pressed("paraDireita")):
		global_position.x += (velocidade * delta) #direita
		
	#Limita o personagem dentro da tela do jogo
	var larguraJanela = get_viewport().size.x
	var alturaJanela = get_viewport().size.y
	global_position.x = clamp(global_position.x, 50, larguraJanela-50)
	global_position.y = clamp(global_position.y, 50, alturaJanela-50)
	
	#Disparo
	if (Input.is_action_just_pressed("disparar")):
		var cena_disparo = preload("res://cena_disparo.tscn")
		var objeto_disparo = cena_disparo.instance()
		objeto_disparo.global_position = $Position2D.global_position
		objeto_disparo.get_node("Area2D").tipoDisparo = tipo_disparo
		
		get_tree().root.add_child(objeto_disparo)



func _on_Timer_timeout():
	tipo_disparo = 1

func morrer():
	queue_free()
	get_tree().change_scene("res://cena_game_over.tscn")

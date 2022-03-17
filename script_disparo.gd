extends Node2D

var tipoDisparo: int
var velocidade = 350
var danoDisparo1 = 1
var danoDisparo2 = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$Disparo1.visible = false
	$Disparo2.visible = false
	
	if (tipoDisparo==1):
		$Disparo1.visible = true
	elif (tipoDisparo==2):
		$Disparo2.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= (velocidade * delta)


func acerto_disparo(area2dInimigo):

	if (area2dInimigo.name=="Inimigo"):
		#Animação do inimigo explodindo
		
		#Realiza o dano no inimigo para que ele possa receber mais de um tiro
		var dano = 0
		if (tipoDisparo==1):
			dano = danoDisparo1
		elif (tipoDisparo==2):
			dano = danoDisparo2
			
		area2dInimigo.velocidade -= 25
		area2dInimigo.qtd_vida -= dano
		
		if (area2dInimigo.qtd_vida<=0):
			#desativa o colision shape
			area2dInimigo.get_node("CollisionShape2D").set_deferred("disable", true)
			area2dInimigo.get_node("AnimationPlayer").play("explodindo")
		else:
			area2dInimigo.get_node("AnimationPlayer").play("sofrendo")
			#Apaga o disparo
		queue_free()

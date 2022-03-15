extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Disparo1.visible = false
	$Disparo2.visible = false
	
	if (Global.tipo_disparo==1):
		$Disparo1.visible = true
	elif (Global.tipo_disparo==2):
		$Disparo2.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
var velocidade = 350
func _process(delta):
	position.y -= (velocidade * delta)


func acerto_disparo(area2dInimigo):

	if (area2dInimigo.name=="Inimigo"):
		#Animação do inimigo explodindo
		area2dInimigo.velocidade = 0
		#area2dInimigo.get_node("CollisionShape2D").queue_free()
		
		#desativa o colision shape
		area2dInimigo.get_node("CollisionShape2D").set_deferred("disable", true)
		area2dInimigo.get_node("AnimationPlayer").play("explodindo")
		
		#Apaga o disparo
		queue_free()

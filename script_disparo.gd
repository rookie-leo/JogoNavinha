extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var velocidade = 350
func _process(delta):
	position.y -= (velocidade * delta)


func acerto_disparo(area2dInimigo):
	#Distroi o inimigo
	#area.queue_free()
	
	#Animação do inimigo explodindo
	area2dInimigo.velocidade = 0
	#area2dInimigo.get_node("CollisionShape2D").queue_free()
	
	#desativa o colision chape
	area2dInimigo.get_node("CollisionShape2D").set_deferred("disable", true)
	area2dInimigo.get_node("AnimationPlayer").play("explodindo")
	
	#Apaga o disparo
	queue_free()

extends Node3D


var velocidade = 50
var direcao = Vector3.FORWARD
var alvo : CharacterBody3D

func _ready():
	pass
	#alvo  = get_tree().get_first_node_in_group("player")
	##await get_tree().create_timer(3.0).timeout
	##queue_free()

func _process(delta):
	global_position += direcao * velocidade * delta

func set_direcao(nova_direcao):
	direcao = nova_direcao
	look_at(global_position + direcao, Vector3.UP)



func _on_latido_inimigo_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and body != alvo:
		if body.has_method("TremerControle"):
			body.TremerControle()
			GameManager.GameManagerInScene.AddLife(-1)
			queue_free()

extends CharacterBody3D


var seguindo = false
var player = null
var velocidade = 5

@onready var area: Area3D = $gatinho/Area3D 

func _ready():

	player = get_tree().get_first_node_in_group("player")
	

func _process(delta):

	if seguindo and player:
		var direcao = (player.global_position - global_position).normalized()
		direcao.y = 0
		global_position += direcao * velocidade * delta
		look_at(player.global_position, Vector3.UP)



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		seguindo = true
		$gatinho/AudioStreamPlayer.play()

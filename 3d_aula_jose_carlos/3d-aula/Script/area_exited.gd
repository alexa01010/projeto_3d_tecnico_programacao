extends Area3D

@onready var frente: Node3D = $CollisionShape3D/Frente
@onready var trás: Node3D = $CollisionShape3D/Trás
@onready var esquerda: Node3D = $CollisionShape3D/Esquerda
@onready var direita: Node3D = $CollisionShape3D/Direita

func _ready() -> void:
	body_exited.connect(PrintExitedSide)

func PrintExitedSide(body: Node3D)-> void:
	if !body.is_in_group("player"):
		return
		
	var distFront = frente.global_position.distance_to(body.global_position)
	var distBack = trás.global_position.distance_to(body.global_position)
	if distBack <= distFront:
		print("de  tras")
		return
	print("de frente")
		

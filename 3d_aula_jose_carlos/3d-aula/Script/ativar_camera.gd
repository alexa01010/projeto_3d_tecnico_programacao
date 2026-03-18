extends Area3D

@export var camera_path : NodePath
var camera 
@export var segue = false
var alvo

func _ready() -> void:
	if camera_path != null:
		camera = get_node(camera_path)

func _process(delta: float) -> void:
	if segue and alvo != null:
		camera.look_at(alvo.global_transform.origin,Vector3.UP)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		alvo = body
		camera.current = true

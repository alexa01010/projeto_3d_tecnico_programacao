extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_espinhos_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		#GameManager.GameManagerInScene.AddLife(-1)
	#if GameManager.GameManagerInScene.hpPlayer <= 0:
		$CSGCylinder3D/espinhos_area/CollisionShape3D.disabled = true
		$CSGCylinder3D/espinhos_area.monitorable = false
		$CSGCylinder3D/espinhos_area.monitoring = false
		#GameManager.GameManagerInScene.player_node.morte()

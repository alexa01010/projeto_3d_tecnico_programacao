extends Area3D


var coletado = false

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and not coletado:
		coletado = true
		queue_free()

extends PathFollow3D
var speed = 5
func _process(delta: float) -> void:
	position.x += speed

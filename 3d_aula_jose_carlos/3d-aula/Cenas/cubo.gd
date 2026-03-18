extends RigidBody3D

var vida = 3

func _ready() -> void:
	vida = 3
	



func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("hitbox"):
		print("aaaai")
		vida -= 1
		
	if vida == 0:
		queue_free()

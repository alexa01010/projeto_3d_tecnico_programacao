extends RigidBody3D
#
#signal coletado
#var isGet = false
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#var area3Dhere = $Area3D
	#area3Dhere.area_entered.connect(coletar)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#
#func coletar(entroNode: Area3D)-> void:
	#if !entroNode.owner.is_in_group("player"):
		#return
	#coletado.emit()
	#GameManager.AddScore(1)
	#isGet = true
	#print("coletadosdddd")
	#queue_free()
#
#func save():
	#var save_dict = {
		#"filename": get_scene_file_path(),
		#"pos_x": position.x,
		#"pox_y": position.y,
		#"pos_z": position.z,
		#"is_get": isGet,
	#}
	#
	#return save_dict

extends Node3D

#func SetCheckPoint(body: Node3D):
	#GameManager.GameManagerInScene.SavePosPLayer = body.global_position
	##SaveLoad.saveLoadScene.save_game()

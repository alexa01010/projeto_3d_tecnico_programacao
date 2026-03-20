extends Node3D

@export var AddValue:int = 1
#
func AddScore() -> void:
	GameManager.AddScore(AddValue)


func _on_coletavel_coletado() -> void:
	AddScore()

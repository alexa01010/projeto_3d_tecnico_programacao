extends Area3D
class_name HurtBox

@export var maxHp : int = 1 
var hpNow : int

func _ready() -> void:
	hpNow = maxHp
	
func AddHp(add : int)-> void:
	hpNow += add
	
	if hpNow > maxHp:
		hpNow = maxHp
	elif hpNow <= 0:
		hpNow = 0
		owner.hide()
	if owner.is_in_group("player"):
		GameManager.GameManagerInScene.AddLife(add)

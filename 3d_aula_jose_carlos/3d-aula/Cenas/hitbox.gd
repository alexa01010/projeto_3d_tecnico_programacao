extends Area3D
class_name  HitBox


@export var damage: int = 1

func _ready() -> void:
	area_entered.connect(EnterArea)
	pass

func EnterArea(area: Area3D) -> void:
	if !area.has_method("AddHp"):
		return
	area.AddHp(-damage)

func Disactive()-> void:
	monitorable = false
	monitoring = false

func Active()-> void:
	monitorable = false
	monitoring= false
	
	

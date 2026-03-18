extends Node3D

@export var ir_pro_game : PackedScene
@export var ir_pro_creditos: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(ir_pro_game)


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://sons/control_volume.tscn")


func _on_button_4_pressed() -> void:
	get_tree().quit()

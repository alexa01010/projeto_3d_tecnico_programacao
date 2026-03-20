extends Node3D

@onready var animation_player: AnimationPlayer = $buddybuddy/AnimationPlayer
@onready var button: Button = $CanvasLayer/VBoxContainer/Button
@onready var button_2: Button = $CanvasLayer/VBoxContainer/Button2
@onready var button_3: Button = $CanvasLayer/VBoxContainer/Button3
@onready var button_4: Button = $CanvasLayer/VBoxContainer/Button4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.grab_focus()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	animation_player.play("Jump")
	await get_tree().create_timer(0.6).timeout
	get_tree().change_scene_to_file("res://Cenas/CENAS/fase_1.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/CENAS/fase_1.tscn")


func _on_button_3_pressed() -> void:
	
	get_tree().change_scene_to_file("res://sons/control_volume.tscn")


func _on_button_4_pressed() -> void:
	get_tree().quit()

extends Node3D


@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_button_pressed() -> void:
	if is_inside_tree():
		audio_stream_player.play()
		get_tree().change_scene_to_file("res://Cenas/CENAS/fase_1.tscn")


func _on_menu_pressed() -> void:
	if is_inside_tree():
		audio_stream_player.play()
		get_tree().change_scene_to_file("res://tela_inicial.tscn")

func _on_button_2_pressed() -> void:
	audio_stream_player.play()
	get_tree().quit()

extends Area3D

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
var ja_passou = false
var pedras_caindo = false

func _ready() -> void:
		animation_player.play("tremendo")


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and ja_passou == false:
		pedras_caindo = true
		animation_player.play("caindo")
		await get_tree().create_timer(2.0).timeout
		ja_passou = true
		pedras_caindo = true
		animation_player.play("nochao")



func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player") and pedras_caindo == false:
		animation_player.play("nochao")
	elif ja_passou == true:
		pass

extends Area3D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
var ativado = false

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and not ativado:
		ativado = true
		
		# Animação opcional
		if animation_player:
			animation_player.play("ativar")
		
		# SIMPLES: só salva a posição
		GameManager.GameManagerInScene.salvar_checkpoint(global_position)

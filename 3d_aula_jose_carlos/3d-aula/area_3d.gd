extends Area3D

func FallInHole(body : Node3D)-> void:
	if body.is_in_group("player"):
		GameManager.GameManagerInScene.AddLife(-1)
		#var timerTransition : float = 0.1
		#Fade.fade.StartFade(Color.BLACK, 0.1)
		#await get_tree().create_timer(1).timeout
		GameManager.GameManagerInScene.voltar_ao_checkpoint() 
		#Fade.fade.StartFade(Fade.ColorFadeOut, 0.1)

		print(body.name)


func _on_body_entered(body: Node3D) -> void:
	FallInHole(body)

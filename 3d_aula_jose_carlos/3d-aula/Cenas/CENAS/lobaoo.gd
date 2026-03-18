extends Node3D

var vida = 1
var speed = 10
var atacando = false
enum estado {ANDANDO,ATAQUE,MORTO}
var state = estado.ANDANDO
var alvo 
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var path_follow_3d: PathFollow3D = $"../.."
var cooldown = false

func _process(delta: float) -> void:
	if vida <= 0:
		state = estado.MORTO
	match state:
		estado.ANDANDO:
			animation_player.play("Walk")
			path_follow_3d.progress += speed * delta
		estado.ATAQUE:
			animation_player.play("Attack")
		estado.MORTO:
			animation_player.play("T")


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and vida >= 1:
		print("oie")
		state= estado.ATAQUE 
		GameManager.GameManagerInScene.AddLife(-1)
		alvo = body
		alvo.TremerControle()
		
func ataque():
	alvo.TremerControle()

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player") and vida >= 1:
		state= estado.ANDANDO

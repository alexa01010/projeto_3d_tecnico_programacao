extends Node3D

var vida = 5
var speed = 10
var atacando = false
enum estado {ANDANDO,ATAQUE,MORTO}
var state = estado.ANDANDO
var alvo 
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var path_follow_3d: PathFollow3D = $".."

var morto = false
var cooldown = false
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var lobaoo: Node3D = $"."

func _ready() -> void:
	lobaoo.show()
func _process(delta: float) -> void:
	if vida <= 1 and morto == false:
		state = estado.MORTO
		audio_stream_player.play()
		await get_tree().create_timer(1).timeout
		morto = true
		
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

func tirar_vida(amount: int):
	vida -= amount
	if vida == 0:
		queue_free()



func _on_hurtbox_area_entered(area: Area3D) -> void:
	print("entrou aaaaaaaaaaa")
	if area.is_in_group("ataque_player")and not morto:
		vida -=1

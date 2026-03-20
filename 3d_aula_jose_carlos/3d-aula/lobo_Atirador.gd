extends Node3D

@export var vida = 3
var speed = 10
var atacando = false
enum estado {ANDANDO,ATAQUE,MORTO}
var state = estado.ANDANDO
var alvo 
@onready var anim: AnimationPlayer = $AnimationPlayer

var morreu = false
var cooldown = false

@export var cena_tiro : PackedScene

var pode_atirar =true
@onready var timer: Timer = $"../Timer"
@onready var spawn_tiro: Marker3D = $"../spawn_tiro"
@onready var pivo: Node3D = $"."

@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"

func _ready() -> void:
	$".".show()

func _process(delta: float) -> void:
	if vida <= 0 and morreu == false:
		state = estado.MORTO
		morreu = true
		print("Inimigo morreu!")
	
	match state:
		estado.ANDANDO:
			anim.play("Walk")
			pivo.rotation_degrees = Vector3(0,0,0)
		
		estado.ATAQUE:
			if alvo and vida >= 1:
				look_at_target()
				if pode_atirar:
					pivo.look_at(alvo.global_position, Vector3.UP)
					anim.play("Attack")
					atirar()
					pode_atirar = false
					timer.start()
					print("Atacando! Timer iniciado")
		
		estado.MORTO:
			$".".hide()

func look_at_target():
	if alvo is CharacterBody3D:
		var target_position = alvo.global_position
		target_position.y = global_position.y
		look_at(target_position, Vector3.UP)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		state = estado.ATAQUE
		alvo = body
		alvo.TremerControle()

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		state = estado.ANDANDO
		alvo = null

func atirar():
	if cena_tiro and alvo and spawn_tiro:
		var tiro = cena_tiro.instantiate()
		tiro.global_position = spawn_tiro.global_position
		audio_stream_player.play()
		var direcao = (alvo.global_position - spawn_tiro.global_position).normalized()
		tiro.look_at(tiro.global_position + direcao, Vector3.UP)
		get_tree().current_scene.add_child(tiro)
		if tiro.has_method("set_direcao"):
			tiro.set_direcao(direcao)
		

func _on_timer_timeout() -> void:
	pode_atirar = true

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("ataque_player"):
		vida -= 1

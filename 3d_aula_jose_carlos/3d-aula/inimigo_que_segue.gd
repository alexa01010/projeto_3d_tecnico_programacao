extends CharacterBody3D
@export var vida = 3
var speed = 5 

enum estado {PARADO, ATAQUE, MORTO}
var state = estado.PARADO
var alvo 

@onready var anim: AnimationPlayer = $lobaoo/AnimationPlayer
@onready var hitbox: Area3D = $lobaoo/Area3D 

var morreu = false
var pode_atacar = true
var distancia_ataque = 2.0 

@onready var timer_ataque: Timer = $Timer
func _ready() -> void:
	show()
	timer_ataque.wait_time = 1.5 

func _process(delta: float) -> void:
	if vida <= 0 and not morreu:
		state = estado.MORTO
		morreu = true

	
	match state:
		estado.PARADO:
			anim.play("Walk")  
		
		estado.ATAQUE:
			if alvo and vida >= 1:
				var distancia = global_position.distance_to(alvo.global_position)
				
				look_at_target()
				
				if distancia > distancia_ataque:
					anim.play("Walk") 
					perseguir_alvo(delta)
				else:
					velocity = Vector3.ZERO
					move_and_slide()
					
					if pode_atacar:
						anim.play("Attack") 
						pode_atacar = false
						timer_ataque.start()
						await get_tree().create_timer(0.3).timeout

		
		estado.MORTO:
			hide()
			set_physics_process(false)

func look_at_target():
	if alvo:
		var target_position = alvo.global_position
		target_position.y = global_position.y
		look_at(target_position, Vector3.UP)

func perseguir_alvo(delta):
	if alvo:
		var direcao = (alvo.global_position - global_position).normalized()
		direcao.y = 0  
		velocity = direcao * speed
		move_and_slide()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		state = estado.ATAQUE
		alvo = body

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		state = estado.PARADO
		alvo = null
		velocity = Vector3.ZERO


func _on_timer_timeout() -> void:
	pode_atacar = true


func _on_hitbox_area_entered(area: Area3D) -> void:
	if area.is_in_group("ataque_player"):
		vida -= 1


func tomar_dano(dano):
	if morreu:
		return
	
	vida -= dano
	print("Boss tomou dano! Vida: ", vida)
	
	if vida <= 0:
		morrer()

func morrer():
	morreu = true
	print("morreu")

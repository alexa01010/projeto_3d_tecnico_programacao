extends CharacterBody3D
 
signal  morreu

const SPEED = 35
var JUMP_VELOCITY = 20
@export var gravity_mult = 4
@export var alturaPulo = 4

@onready var pivo: Node3D = $"Armação"
@onready var animation_player: AnimationPlayer = $"Armação/Skeleton3D/AnimationPlayer"


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")# * 8
@export var turn_vel = 7.5
var num_rotacao = deg_to_rad(0)


var pular = false
var esta_pulando = false
var pulo_duplo = false

@onready var collision_shape_3d: CollisionShape3D = $hitbox/CollisionShape3D


var esta_atacando = false
var esta_morto = false
func _ready() -> void:
	collision_shape_3d.disabled = false
	esta_atacando = false
	esta_morto = false

func _process(delta: float) -> void:
	animation(delta)

func _physics_process(delta: float) -> void:
	#if esta_atacando:
		#return
	if not is_on_floor():
		esta_pulando = true
		velocity.y -= gravity * gravity_mult * delta
	else: 
		pulo_duplo = true
		esta_pulando = false
	if Input.is_action_pressed("atacar"):
		ataque()
	if Input.is_action_just_pressed("pular") and is_on_floor():
		animation_player.play("Jump")
		pular = true
		esta_pulando = true
		velocity.y = JUMP_VELOCITY
		pulo_duplo = true
		
	elif Input.is_action_just_pressed("pular") and pulo_duplo and esta_pulando:
		animation_player.play("Jump")
		velocity.y = JUMP_VELOCITY * 1
		pulo_duplo = false
	var input_dir := Input.get_vector("direita", "esquerda", "trás", "frente")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
				
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func ataque():

		esta_atacando = true
		print("atacando")
		animation_player.play("Attack")
		collision_shape_3d.disabled = false
		await get_tree().create_timer(2.0).timeout
		collision_shape_3d.disabled = true
		esta_atacando = false
		
func animation(delta):
	if esta_pulando or esta_atacando or esta_morto:
		return
	if is_on_floor():
		var andando = false
		if Input.is_action_pressed("frente"):
			andando = true
			animation_player.play("Walk")
			num_rotacao = deg_to_rad(0)
			if Input.is_action_pressed("esquerda"):
				num_rotacao = deg_to_rad(45)
			elif Input.is_action_pressed("direita"):
				num_rotacao = deg_to_rad(-45)
			
			rotacionar(delta)
		
		elif Input.is_action_pressed("trás"):
			andando = true
			animation_player.play("Walk")
			num_rotacao = deg_to_rad(180)
			if Input.is_action_pressed("esquerda"):
				num_rotacao = deg_to_rad(135)
			elif Input.is_action_pressed("direita"):
				num_rotacao = deg_to_rad(-135)
			rotacionar(delta)
		
		elif Input.is_action_pressed("esquerda"):
			andando = true
			animation_player.play("Walk")
			num_rotacao = deg_to_rad(90)
			rotacionar(delta)
		
		elif Input.is_action_pressed("direita"):
			andando = true
			animation_player.play("Walk")
			num_rotacao = deg_to_rad(-90)
			rotacionar(delta)
		else:
			animation_player.play("IdleAnim2")
			rotacionar(delta)
func rotacionar(delta):
	pivo.rotation.y = lerp_angle(pivo.rotation.y, num_rotacao, turn_vel * delta)
	
func TremerControle()-> void:
	Input.stop_joy_vibration(0)
	Input.start_joy_vibration(0, 0.2, 0.5, 1)


func morte():
		esta_morto = true
		print("morto")
		animation_player.play("Death1")
		set_physics_process(false)
		#set_process(false)
		collision_shape_3d.disabled = true
		await get_tree().create_timer(3.0).timeout
		collision_shape_3d.disabled = true
		esta_morto = false
		GameManager.voltar_ao_checkpoint()
	
		await get_tree().create_timer(1.0).timeout
		reviver()
		GameManager.GameManagerInScene.AddLife(4)

func reviver() -> void:
	if HudNode.HudInScene:
			HudNode.HudInScene.AttHp(4)
	esta_morto = false
	set_physics_process(true)
	#set_process(true)
	collision_shape_3d.disabled = false
	if animation_player.has_animation("IdleAnim2"):
		animation_player.play("IdleAnim2")

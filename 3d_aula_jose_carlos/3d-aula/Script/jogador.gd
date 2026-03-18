extends CharacterBody3D


const SPEED = 10
var JUMP_VELOCITY = 10
@export var alturaPulo = 2
var CanCancelJump = false
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") * 0.1

@onready var animation_player: AnimationPlayer = $hello_kitty2/AnimationPlayer
@onready var path_follow_3d: PathFollow3D = $"../Path3D/PathFollow3D"

@export var model3d : Node3D
var rotate_speed: float = 12

var AttAnimationMove : bool = false
@export var animation : AnimationPlayer

var canMove: bool = true
#@onready var audioEmitter : AudioStreamPlayer3D
#@export var sfxAttackGo : AudioStream
var CanAttack : bool = false
@export var hitbox: HitBox
@export var Hp = 10
@export var hurt_box: HurtBox

func _ready() -> void:
	
	var TargetPos: Vector3 = Vector3.FORWARD*10
	var delta : Vector3 = TargetPos - global_position
	#CalcAltura()
#
#func CalcAltura()-> void:
	#var TempoQueda = alturaPulo * 2 / gravity
	#TempoQueda = sqrt(TempoQueda)
	#JUMP_VELOCITY = TempoQueda* gravity
	
func AttRotate(directionTurn: Vector3, delta : float)-> void:
	if directionTurn.length_squared() == 0:
		return
	var novoAngY : float = Vector3.BACK.signed_angle_to(directionTurn, Vector3.UP)
	model3d.global_rotation.y = lerp_angle(model3d.rotation.y, novoAngY, rotate_speed * delta)


func _physics_process(delta: float) -> void:
#s	Animation()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		CancelJump()
		
	if is_on_floor():
		SetAnimation("RUN", -1)

	if Input.is_action_just_pressed("pular") and is_on_floor():
		SetAnimation("death", -1)
		velocity.y = JUMP_VELOCITY
		
  
	if Input.is_action_pressed("atacar"):
		ataque()
		#Attack_1()
		#SetAnimation("ataque3", -1)
		#AttAnimationMove = false
		
	var input_dir := Input.get_vector("esquerda", "direita", "frente", "trás")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	var cameraNow : Camera3D  = get_viewport().get_camera_3d()
	var rotationX := cameraNow.rotation
	direction = direction *Quaternion.from_euler(rotationX)
	if direction:
		SetAnimation("RUN", -1)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		#if CanAttack == false:
		ResetAnimation()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	AttRotate(direction, delta)
	move_and_slide()
#
#func Attack_1()-> void:
	#if !CanAttack:
		#return
	#var speedAnim : float = 5
	#SetAnimation("ataque3", speedAnim)
	#AttAnimationMove = false
	#canMove = false
	#CanAttack = true
	#
	##audioEmitter.stream = sfxAttackGo
	##audioEmitter.play()
	##
	#await get_tree().create_timer(1/speedAnim).timeout
	##
	##hitbox.Active()
	#
	#await get_tree().create_timer(0.5).timeout
	#
	##hitbox.Disactive()
	#ResetAnimation()
	#canMove = true
	#CanAttack = true

func StartJump():
	velocity.y = JUMP_VELOCITY
	CanCancelJump = true

func CancelJump() -> void:
	if !CanCancelJump:
		return
		velocity.y *= 0.5
		CanCancelJump = false

func SetAnimation(nameAnim: String, SpeedAnim : float = 1, valueTransition : float = 0.2)->void:
	if !animation:
		return
	animation.play(nameAnim, valueTransition, SpeedAnim)
	
func ResetAnimation()-> void:
	SetAnimation("Idle")
	AttAnimationMove = true

func ataque():
	if CanAttack == false:
		CanAttack = true
		$hitbox/CollisionShape3D.disabled = false
		$AnimationPlayer.play("ataque3")
		await $AnimationPlayer.animation_finished
		CanAttack = false
		$hitbox/CollisionShape3D.disabled = true
		
		pass
func save():
	var save_dict = {
		"filename" : scene_file_path,
		"pos_x" : position.x,
		"pos_y": position.y,
		"pos_z": position.z,
		"current_health" : GameManager.GameManagerInScene.hpPlayer
	}
	return save_dict

func load_data(node_data)->void:
	position.x = node_data["pos_x"]
	position.y = node_data["pos_y"]
	position.z = node_data["pos_z"]
	GameManager.GameManagerInScene.hpPlayer = node_data["current_health"]
	
	
	
	
	

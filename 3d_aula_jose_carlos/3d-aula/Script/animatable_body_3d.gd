extends AnimatableBody3D

@export var PathFollow : PathFollow3D
@export var durationPath: float = 1
@export var oi : Timer 
var speed : float 
var goingback : bool = false

var canMove : bool = false

func _ready() -> void:
	oi.timeout.connect(SetCanMove)
	oi.start()
	speed = 1.0 / durationPath
	
func _physics_process(delta: float) -> void:
	
	if !canMove:
		return
		
	if goingback:
		PathFollow.progress_ratio -= speed * delta
	else:
		PathFollow.progress_ratio += speed * delta
	
	global_position = PathFollow.global_position
	
	if (goingback && PathFollow.progress_ratio == 0) || (not goingback && PathFollow.progress_ratio == 1):
		oi.start()
		canMove = false
		goingback = !goingback
	
func SetCanMove()-> void:
	canMove = true

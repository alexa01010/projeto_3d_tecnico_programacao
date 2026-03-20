extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var setor_1: Node3D = $Setor1
@onready var csg_box_3d_2: CSGBox3D = $CSGBox3D2
@onready var arbustos_2: Node3D = $arbustos2



func _ready() -> void:
	arbustos_2.hide()
	$arbustos2/Arbusto4/StaticBody3D/CollisionShape3D.disabled = true
	$arbustos2/Arbusto5/StaticBody3D/CollisionShape3D.disabled = true
	$arbustos2/Arbusto6/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto7/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto9/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto8/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto10/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto11/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto12/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto13/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto14/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto15/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto16/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto17/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto18/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto19/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto20/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto21/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto22/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto23/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto24/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto25/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto26/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto27/StaticBody3D/CollisionShape3D.disabled= true
	$arbustos2/Arbusto28/StaticBody3D/CollisionShape3D.disabled= true
	#csg_box_3d_2.use_collision = false
	#setor_1.show()
	#animation_player.play("camera_normal")
	#
#func _on_area_3d_body_entered(body: Node3D) -> void:
	#if body.is_in_group("player"):
		#animation_player.play("camera_mudando")
		#csg_box_3d_2.use_collision = true
		#setor_1.hide()
		#arbustos_2.show()
	#$arbustos2/Arbusto4/StaticBody3D/CollisionShape3D.disabled = false
	#$arbustos2/Arbusto5/StaticBody3D/CollisionShape3D.disabled = false
	#$arbustos2/Arbusto6/StaticBody3D/CollisionShape3D.disabled=false
	#$arbustos2/Arbusto7/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto9/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto8/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto10/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto11/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto12/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto13/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto14/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto15/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto16/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto17/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto18/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto19/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto20/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto21/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto22/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto23/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto24/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto25/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto26/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto27/StaticBody3D/CollisionShape3D.disabled= false
	#$arbustos2/Arbusto28/StaticBody3D/CollisionShape3D.disabled= false
		#

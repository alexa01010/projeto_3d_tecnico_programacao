extends Node

class_name GameManager 

static  var GameManagerInScene : GameManager = null
var score : int = 0
var HudScene : HudNode = null
var hpPlayer: int = 4
var SavePosPLayer : Vector3
var player_node : Node3D
var virou_camera = false

func _ready() -> void:
	player_node = get_tree().get_first_node_in_group("player")
	GameManagerInScene = self
	SavePosPLayer = player_node.global_position
static func AddScore(add:int)-> void:
	GameManagerInScene.score += add
	HudNode.HudInScene.AttScores()

static func GetScore()-> int:
	return GameManagerInScene.score

static func AddLife(add : int) -> void:
	GameManagerInScene.hpPlayer += add
	HudNode.HudInScene.AttHp(GameManagerInScene.hpPlayer)
	if GameManagerInScene.hpPlayer <= 0:
		GameManagerInScene.player_node.morte()
		return
		
#static func RestartPlayerPos()-> void:
	#GameManagerInScene.player_node.global_position = GameManagerInScene.SavePosPLayer

static func salvar_checkpoint(posicao: Vector3) -> void:
	GameManagerInScene.SavePosPLayer = posicao
	print("Checkpoint salvo!")


static func voltar_ao_checkpoint() -> void:
	if GameManagerInScene.player_node:
		GameManagerInScene.player_node.global_position = GameManagerInScene.SavePosPLayer
		print("Voltou ao checkpoint!")

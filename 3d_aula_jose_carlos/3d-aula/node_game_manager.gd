extends Node

class_name GameManager 

static  var GameManagerInScene : GameManager = null
var score : int = 0
var HudScene : HudNode = null
var hpPlayer: int = 6
var SavePosPLayer : Vector3
var player_node : Node3D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


@onready var audio_stream_player_2: AudioStreamPlayer = $AudioStreamPlayer2

func _ready() -> void:
	player_node = get_tree().get_first_node_in_group("player")
	GameManagerInScene = self
	SavePosPLayer = player_node.global_position
#


static func AddScore(add: int) -> void:
	if GameManagerInScene:
		GameManagerInScene.score += add
		print("Pontos adicionados: ", add, " Total: ", GameManagerInScene.score)
		
		# Atualiza o HUD
		if HudNode.HudInScene:
			HudNode.HudInScene.AttScores()
		else:
			print("ERRO: HudNode.HudInScene não encontrado!")

static func GetScore() -> int:
	if GameManagerInScene:
		return GameManagerInScene.score
	return 0

func AddLife(add : int) -> void:
	GameManagerInScene.hpPlayer += add
	HudNode.HudInScene.AttHp(GameManagerInScene.hpPlayer)
	if GameManagerInScene.hpPlayer <= 0:
		audio_stream_player.play()
		GameManagerInScene.player_node.morte()
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://tela_derrota.tscn")
		return
		
static func RestartPlayerPos()-> void:
	GameManagerInScene.player_node.global_position = GameManagerInScene.SavePosPLayer

static func salvar_checkpoint(posicao: Vector3) -> void:
	GameManagerInScene.SavePosPLayer = posicao
	print("Checkpoint salvo!")


static func voltar_ao_checkpoint() -> void:
	if GameManagerInScene.player_node:
		GameManagerInScene.player_node.global_position = GameManagerInScene.SavePosPLayer
		print("Voltou ao checkpoint!")

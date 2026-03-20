extends Control

class_name HudNode

@export var TextScore: RichTextLabel  
@export var hpNodesArray : Array [Control]
static var HudInScene : HudNode = null
@onready var label: Label = $Label

func _ready() -> void:
	AttHp(6)
	HudInScene = self

func AttScores()-> void:
	TextScore.text = "Pontos: " + str(GameManager.GameManagerInScene.GetScore())

func AttHp(hpNow: int)-> void:
	for i in range(hpNodesArray.size()):
		var nodeHpX: Control = hpNodesArray[i]
		
		if i < hpNow:
			nodeHpX.show()
		else:
			nodeHpX.hide()

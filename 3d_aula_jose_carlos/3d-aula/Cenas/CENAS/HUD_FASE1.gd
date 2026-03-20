extends CanvasLayer
#@export var vida : int = 10
#@export var max_vida : int = 10
#
#var pontos : int = 0
#
#@onready var vida_label: Label = $Label
#@onready var pontos_label: Label = $Label2  # Label para mostrar os pontos
#
#
#func _ready() -> void:
	#atualizar_vida()
	#atualizar_pontos()
#
#func pontuacao():
	#pontos += 1
	#atualizar_pontos()
#
#func atualizar_pontos():
	#if pontos_label:
		#pontos_label.text = "Pontos: " + str(pontos)
#
#func atualiza_vida(value_vida: int):
	#vida += value_vida
	#vida = clamp(vida, 0, max_vida)
	#atualizar_vida()
	#
	#if vida <= 0:
		#print("morreu")
#
#func atualizar_vida():
	#if vida_label:
		#vida_label.text = "Vida: " + str(vida) + "/" + str(max_vida)

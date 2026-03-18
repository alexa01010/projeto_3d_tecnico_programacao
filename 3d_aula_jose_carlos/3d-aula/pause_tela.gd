extends CanvasLayer

@export var voltar : PackedScene
@export var sair : PackedScene

@onready var retornar_button: Button = $holder/retornar_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		
func _on_retornar_button_pressed() -> void:
	get_tree().paused = false
	visible = false
	retornar_button.grab_focus() 

func _on_sair_button_pressed() -> void:
	get_tree().quit()

extends Control
class_name Fade

var speedFade : float = 1
var progressFade : float 
var colorStart : Color
var colorTarget: Color

const ColorFadeOut : Color = Color(Color.BLACK, 0)

static var fade : Fade

func _ready() -> void:
	fade = self
	StartFade(ColorFadeOut, 1)
	
func _process(delta: float) -> void:
	if modulate == colorTarget:
		if modulate.a == 0 and visible:
			hide()
		
		return
	progressFade += speedFade * delta
	modulate = lerp(colorStart, colorTarget, progressFade)
	
func StartFade(ColorGo: Color, speed : float)-> void:
	if ColorGo == fade.modulate:
		return
	colorStart = modulate
	progressFade = 0
	colorTarget = ColorGo
	
	speedFade = speed
	show()

extends HSlider
@export var bus_name : String = "Música"
var busSoundID: int 
@export var audio_stream_player: AudioStreamPlayer 


func _ready() -> void:
	busSoundID = AudioServer.get_bus_index(bus_name)
	value = AudioServer.get_bus_volume_linear(busSoundID) * 10
	
func _value_changed(new_value: float) -> void:
	AudioServer.set_bus_volume_linear(busSoundID, new_value/100)
	if audio_stream_player:
		audio_stream_player.stop()
		audio_stream_player.play()

extends AudioStreamPlayer
@export var delSounds: Array[AudioStreamWAV]
@export var dingSounds: Array[AudioStreamWAV]
	
func _on_ding_noise_pressed():
		self.set_stream(dingSounds.pick_random())
		self.play()


func _on_del_noise_pressed():
		self.set_stream(delSounds.pick_random())
		self.play()

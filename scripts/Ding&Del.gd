extends AudioStreamPlayer

@export var dingGood: AudioStreamRandomizer
@export var dingBad: AudioStreamRandomizer
@export var DDS: AudioStreamRandomizer
@export var DDH: AudioStreamRandomizer
@export var del: AudioStreamRandomizer


func on_DelSounded_Recieved():
	self.set_stream(del)
	self.play()
func on_DingGooded_Recieved():
	self.set_stream(dingGood)
	self.play()
func on_DingBaded_Recieved():
	self.set_stream(dingBad)
	self.play()
func on_DDSadded_Recieved():
	self.set_stream(DDS)
	self.play()
func on_DDHappyed_Recieved():
	self.set_stream(DDH)
	self.play()

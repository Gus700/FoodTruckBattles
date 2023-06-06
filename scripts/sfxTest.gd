extends AudioStreamPlayer
@onready var DDSad1: AudioStreamWAV =  preload("res://sounds/D&D Sad 1.wav")
@onready var DDsad2: AudioStreamWAV =  preload("res://sounds/D&D Sad 2.wav")
@onready var DDsad3: AudioStreamWAV =  preload("res://sounds/D&D Sad 3.wav")
@onready var DDyay: AudioStreamWAV =  preload("res://sounds/D&D Yay 1.wav")
@onready var DDyay2: AudioStreamWAV =  preload("res://sounds/D&D Yay 2.wav")
@onready var delburp1: AudioStreamWAV =  preload("res://sounds/delburp1.wav")
@onready var delburp2: AudioStreamWAV =  preload("res://sounds/delburp2.wav")
@onready var delnoise1: AudioStreamWAV =  preload("res://sounds/delnoise1.wav")
@onready var delnoise2: AudioStreamWAV =  preload("res://sounds/delnoise2.wav")
@onready var delnoise3: AudioStreamWAV =  preload("res://sounds/delnoise3.wav")
@onready var delnoise4: AudioStreamWAV =  preload("res://sounds/delnoise4.wav")
@onready var delnoise5: AudioStreamWAV =  preload("res://sounds/delnoise5.wav")
@onready var delnoise6: AudioStreamWAV =  preload("res://sounds/delnoise6.wav")
@onready var delnoise7: AudioStreamWAV =  preload("res://sounds/delnoise7.wav")
@onready var dinggood1: AudioStreamWAV =  preload("res://sounds/dinggood1.wav")
@onready var dinggood2: AudioStreamWAV =  preload("res://sounds/dinggood2.wav")
@onready var dingmad1: AudioStreamWAV =  preload("res://sounds/dingmad1.wav")
@onready var dingmad2: AudioStreamWAV =  preload("res://sounds/dingmad2.wav")
@onready var dingmad3: AudioStreamWAV =  preload("res://sounds/dingmad3.wav")
@onready var dingsad1: AudioStreamWAV =  preload("res://sounds/dingsad1.wav")
@onready var dingsad2: AudioStreamWAV =  preload("res://sounds/dingsad2.wav")
@onready var dingsad3: AudioStreamWAV =  preload("res://sounds/dingsad3.wav")
@onready var dingsad4: AudioStreamWAV =  preload("res://sounds/dingsad4.wav")
@onready var dingsound1: AudioStreamWAV =  preload("res://sounds/dingsound1.wav")
@onready var dingsound2: AudioStreamWAV =  preload("res://sounds/dingsound2.wav")
@onready var delSounds = []
@onready var dingSounds = []

func _ready():
	delSounds = [delburp1,delburp2,delnoise1,delnoise2,delnoise3,delnoise4,delnoise5,delnoise6,delnoise7]
	dingSounds  = [dinggood1,dinggood2,dingmad1,dingmad2,dingmad3,dingsad1,dingsad2,dingsad3,dingsad4,dingsound1,dingsound2]
	
func _on_ding_noise_pressed():
		self.set_stream(dingSounds.pick_random())
		self.play()


func _on_del_noise_pressed():
		self.set_stream(delSounds.pick_random())
		self.play()

extends TextureRect

@export var img : String = "img"
@export var big_img : String = "img"
@export var lore_text : String = "lore"


signal showbig(big_img,lore_text)

func _on_button_pressed():
	self.texture = load("res://assets/loreScenes/photos/"+ img +"_unlocked.png")
	emit_signal("showbig",big_img,lore_text)

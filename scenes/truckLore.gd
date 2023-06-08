extends Control

@export var textImgs: Array[Texture2D]
@onready var textBubbleNode = $textBubble
var textBubIndex = 0

func _ready() -> void:
	setTextBubImg()

func setTextBubImg() -> void:
	textBubbleNode.texture = textImgs[textBubIndex]

#___________________________signal function____________________________________

func _on_texture_button_pressed() -> void:
	if textBubIndex < textImgs.size() - 1:
		textBubIndex += 1
		setTextBubImg()

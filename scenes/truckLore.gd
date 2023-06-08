extends Control

@export var textImgs: Array[Texture2D]
@onready var textBubbleNode = $textBubble
@onready var changeSceneB = $TextureButton
@onready var nextTextB = $NextTextButton
@onready var prevTextB = $PrevTextButton
var textBubIndex = 0

func _ready() -> void:
	setTextBubImg()

func setTextBubImg() -> void:
	#textBubbleNode.texture = textImgs[textBubIndex]
	pass

# if the last text box is being shown then hide next button and show change scene button
func checkIfLastText() -> void:
	if textBubIndex == textImgs.size() - 2:
		nextTextB.hide()
		changeSceneB.show()
	else:
		changeSceneB.hide()
		nextTextB.show()

#___________________________signal function____________________________________

func _on_next_text_button_pressed() -> void:
	print(textBubIndex)
	checkIfLastText()
	if textBubIndex < textImgs.size() - 1:
		textBubIndex += 1
		setTextBubImg()


func _on_prev_text_button_pressed() -> void:
	checkIfLastText()
	print(textBubIndex)
	if textBubIndex > 0:
		textBubIndex -= 1
		setTextBubImg()

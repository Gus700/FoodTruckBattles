extends Control

@export var textImgs: Array[Texture2D]
@onready var textBubbleNode = $textBubble
@onready var challengeB = $TextureButton
@onready var nextTextB = $NextTextButton
@onready var prevTextB = $PrevTextButton
@onready var animNode = $AnimationPlayer
var textBubIndex = 0

func _ready() -> void:
	setTextBubImg()

func setTextBubImg() -> void:
	if textImgs != []:
		textBubbleNode.texture = textImgs[textBubIndex]

# if the last text box is being shown then hide next button and show change scene button
func checkIfLastText() -> void:
	if textBubIndex == textImgs.size() - 2:
		nextTextB.hide()
		challengeB.show()
	else:
		challengeB.hide()
		nextTextB.show()

func checkIfFirstText() -> void:
	if textBubIndex == 0:
		prevTextB.hide()
	else:
		prevTextB.show()

#___________________________signal function____________________________________

func _on_next_text_button_pressed() -> void:
	print(textBubIndex)
	checkIfLastText()
	if textBubIndex < textImgs.size() - 1:
		textBubIndex += 1
		setTextBubImg()
	checkIfFirstText()


func _on_prev_text_button_pressed() -> void:
	checkIfLastText()
	print(textBubIndex)
	if textBubIndex > 0:
		textBubIndex -= 1
		setTextBubImg()
	checkIfFirstText()


func _on_texture_button_pressed() -> void:
	animNode.play("fadeOut")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	self.hide()

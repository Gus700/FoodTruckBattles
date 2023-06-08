extends Control

@export var img: Texture2D
@onready var bgImgNode = $backgroundImage

var available 
var currentFoodTruck: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setBgImg(img)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setBgImg(img) -> void:
	if img != null:
		bgImgNode.texture = img

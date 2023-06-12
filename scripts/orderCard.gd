extends TextureRect

var recipe: Array[String]
var queuePos: int = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func setImg(img) -> void:
	$OrderImage.texture = img

func setRecipe(recievedRec: Array[String]) -> void:
	recipe = recievedRec
	
func getRecipe() ->Array[String]:
	return recipe

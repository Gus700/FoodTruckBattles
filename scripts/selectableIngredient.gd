extends TextureRect

@export var ingredientName: String
@export var mainTexture: Texture

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("IngredientButton").texture_normal = mainTexture
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# when the button is pressed send signal of what ingredient was pressed
func _on_ingredient_button_pressed() -> void:
	print("user slected ingreient: ", ingredientName)
	GlobalSig.emit_signal("ingredient_selected", ingredientName, mainTexture)

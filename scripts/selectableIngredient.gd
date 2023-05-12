extends TextureRect

@export var ingredientName: String
@export var mainTexture: Texture
#var animation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("IngredientButton").texture_normal = mainTexture
	#animation = get_node("AnimationPlayer")
	#animation.play("ingredientFloat")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# when the button is pressed send signal of what ingredient was pressed
func _on_ingredient_button_pressed() -> void:
	GlobalSig.emit_signal("ingredient_selected", ingredientName, mainTexture)

extends HBoxContainer

var currentOrderRecipe: Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# called when order area signals the current order recipe
func _on_order_area_update_recipe(recipe) -> void:
	print("recieved current order recipe: ", recipe)
	currentOrderRecipe = recipe

# called when user hits the completion bell, check if the ingredients in the crafting area are
# correct acording to the current order recipe
func _on_completion_bell_pressed() -> void:
	print("order complete, check for correct ingredients")

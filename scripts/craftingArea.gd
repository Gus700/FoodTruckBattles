extends HBoxContainer

var currentOrderRecipe: Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# connect the global singal and assign the function to run when recieving it
	GlobalSig.ingredient_selected.connect(ingredient_selected)

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
	print("order complete signal recieved, check for correct ingredients")

# recieves global signal of ingredient button with the name of the selected ingredient
func ingredient_selected (ingredient_name) -> void:
	print("recieved ingredient selection: ", ingredient_name)


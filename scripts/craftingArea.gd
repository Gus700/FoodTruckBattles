extends HBoxContainer

var currentOrderRecipe: Array[String]
var userSelectedIngr: Array[String]
var itemScene
signal request_updated_order

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSig.ingredient_selected.connect(ingredient_selected) #connect gobal signal
	itemScene = preload("res://scenes/CraftingItem.tscn")

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
	print("recieved order complete signal in crafting area")
	emit_signal("request_updated_order")

# recieves global signal of ingredient button with the name of the selected ingredient
func ingredient_selected (ingredient_name, ingredient_img) -> void:
	print("recieved ingredient selection: ", ingredient_name)
	var itemSceneInst = itemScene.instantiate() #create instance of Texture node
	itemSceneInst.texture = ingredient_img
	add_child(itemSceneInst) #Add it as a child of this node.
	userSelectedIngr.append(ingredient_name)#append ingredient name to userSelectedIngr Array
	


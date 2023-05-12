extends HBoxContainer

var currentOrderRecipe: Array[String]
var userSelectedIngrs: Array[String]
var recipeIngrIndx: int = 0 #index of currently needed ingredient from the recipe
var numCorrectIngr: int = 0 #keeps track of how many correct ingredients the user has selected
var numCorrectIngrPos: int = 0 #keeps track of how many ingredients have been selected in correct order
var itemScene #used to store the preloaded scene that displays the ingredient image
var isCorrect: bool = false
signal request_updated_order

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSig.ingredient_selected.connect(ingredient_selected) #connect gobal signal
	itemScene = preload("res://scenes/CraftingItem.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# recieves current order signal
func _on_order_area_update_recipe(recipe) -> void:
	print("recieved current order recipe: ", recipe)
	currentOrderRecipe = recipe

# recieves completion signal
func _on_completion_bell_pressed() -> void:
	print("recieved order complete signal in crafting area")
	#check if the ingredients are correct
	if numCorrectIngr == currentOrderRecipe.size() && numCorrectIngrPos == currentOrderRecipe.size():
		isCorrect = true
	if isCorrect == true:
		var correctLabel = Label.new()
		correctLabel.text = "correct"
		add_child(correctLabel)
	emit_signal("request_updated_order")
	for ingr in get_children():
		ingr.queue_free()
	recipeIngrIndx = 0
	numCorrectIngr = 0
	numCorrectIngrPos = 0
	
	

# recieves global signal of ingredient button with the name of the selected ingredient
func ingredient_selected (ingredient_name, ingredient_img) -> void:
	print("recieved ingredient selection: ", ingredient_name)
	var itemSceneInst = itemScene.instantiate() #create instance of Texture node
	itemSceneInst.texture = ingredient_img
	add_child(itemSceneInst) #Add it as a child of this node.
	userSelectedIngrs.append(ingredient_name)#append ingredient name to userSelectedIngr Array
	#recipeIngrIndx+=1 #increment which is the current ingredient needed from the recipe
	# if we are still searching for needed ingredients
	if recipeIngrIndx < currentOrderRecipe.size() && numCorrectIngr != currentOrderRecipe.size(): 
		if currentOrderRecipe[recipeIngrIndx] == ingredient_name:
			numCorrectIngrPos += 1
			recipeIngrIndx += 1
		if currentOrderRecipe.has(ingredient_name):
			numCorrectIngr += 1
		print("amount of correct ingredients: ", numCorrectIngr)
		print("amount of correct ingredients in correct order:, ", numCorrectIngrPos)
	
	

#func checkCorrectIngr (recipe: Array[String], ingredients: Array[String]):
	

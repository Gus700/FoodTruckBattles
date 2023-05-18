extends Control

@onready var ingredientScene :PackedScene = preload("res://scenes/CraftingItem.tscn")
@onready var ingredientContainer :Node = $CuttingBoard/IngredientContainer
var currentOrderRecipe: Array[String]
var userSelectedIngrs: Array[String]
var recipeIngrIndx: int = 0 #index of currently needed ingredient from the recipe
var numCorrectIngr: int = 0 #keeps track of how many correct ingredients the user has selected
var numCorrectIngrPos: int = 0 #keeps track of how many ingredients have been selected in correct order
var isCorrect: bool = false

signal request_updated_order

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSig.ingredient_selected.connect(ingredient_selected) #connect gobal signal

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#___________________________________normal functions________________________________________________

# add an ingredient Scene in the IngredientContainer
func addIngredient(ingrContainer, ingrScene, ingrName, ingrImg,) ->void:
	var ingrScnInst = ingrScene.instantiate()
	ingrScnInst.setImg(ingrImg)
	ingrContainer.add_child(ingrScnInst)
	userSelectedIngrs.append(ingrName)

func clearIngredients() -> void:
	for ingr in ingredientContainer.get_children():
		ingr.queue_free()
	recipeIngrIndx = 0
	numCorrectIngr = 0
	numCorrectIngrPos = 0

# check if the selected ingredient belongs in current recipe and if it was in the correct order
func checkSelectedIngr(ingrName) -> void:
	if recipeIngrIndx < currentOrderRecipe.size() && numCorrectIngr != currentOrderRecipe.size(): 
		if currentOrderRecipe[recipeIngrIndx] == ingrName:
			numCorrectIngrPos += 1
			recipeIngrIndx += 1
		if currentOrderRecipe.has(ingrName):
			numCorrectIngr += 1
		print("amount of correct ingredients: ", numCorrectIngr)
		print("amount of correct ingredients in correct order:, ", numCorrectIngrPos)

func checkCorrectCompletion() ->void:
	#check if the ingredients are correct
	if numCorrectIngr == currentOrderRecipe.size() && numCorrectIngrPos == currentOrderRecipe.size():
		isCorrect = true
	if isCorrect == true:
		var correctLabel = Label.new()
		correctLabel.text = "correct"
		add_child(correctLabel)

#_________________________________signal functions__________________________________________________

# recieves global signal of ingredient button with the name of the selected ingredient
func ingredient_selected (ingrName, ingrImg) -> void:
	print("recieved ingredient selection: ", ingrName)
	addIngredient(ingredientContainer, ingredientScene, ingrName, ingrImg)
	checkSelectedIngr(ingrName)

# recieves current order signal
func _on_order_area_update_recipe(recipe) -> void:
	print("recieved current order recipe: ", recipe)
	currentOrderRecipe = recipe

# recieves completion signal
func _on_completion_bell_pressed() -> void:
	print("recieved order complete signal in crafting area")
	emit_signal("request_updated_order")
	clearIngredients()
	


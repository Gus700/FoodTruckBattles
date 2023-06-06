extends Control

@onready var ingredientScene :PackedScene = preload("res://scenes/CraftingItem.tscn")
@onready var ingredientContainer :Node = $CuttingBoard/IngredientContainer
var currentOrderRecipe: Array[String]
var userSelectedIngrs: Array[String]
var recipeIngrIndx: int = 0 #index of currently needed ingredient from the recipe
var recipeIngrIndxRev: int = 0 #index of currently needed ingredient from the recipe in reverse
var numCorrectIngr: int = 0 #keeps track of how many correct ingredients the user has selected
var numCorrectIngrPos: int = 0 #keeps track of how many ingredients have been selected in correct order
var numCorrectIngrPosRev: int = 0 #keeps track of how many ingredients have been selected in correct order but in reverse
var isCorrect: bool = false

signal request_updated_order
signal show_completion_feedback(isCorrect: bool)

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
	recipeIngrIndxRev = currentOrderRecipe.size() - 1
	numCorrectIngr = 0
	numCorrectIngrPos = 0
	numCorrectIngrPosRev = 0
	userSelectedIngrs = []

# check if the selected ingredient belongs in current recipe and if it was in the correct order
func checkSelectedIngr(ingrName) -> void:
	print("checking for ingredient:" , ingrName)
	if recipeIngrIndx < currentOrderRecipe.size() && recipeIngrIndxRev >= 0 && numCorrectIngr != currentOrderRecipe.size():
		if currentOrderRecipe[recipeIngrIndx] == ingrName && numCorrectIngrPosRev == 0:
			numCorrectIngrPos += 1
			recipeIngrIndx += 1
			print("amount of correct ingredients in correct order:, ", numCorrectIngrPos)
		if currentOrderRecipe[recipeIngrIndxRev] == ingrName && numCorrectIngrPos == 0:
			numCorrectIngrPosRev += 1
			recipeIngrIndxRev -= 1
			print("amount of correct ingredients in correct reverse order:, ", numCorrectIngrPosRev)
		if currentOrderRecipe.has(ingrName):
			numCorrectIngr += 1
			print("amount of correct ingredients: ", numCorrectIngr)

func checkCorrectCompletion() ->void:
	#check if the ingredients are correct
	print(userSelectedIngrs.size())
	print(currentOrderRecipe.size())
	if numCorrectIngr == currentOrderRecipe.size() && (numCorrectIngrPos == currentOrderRecipe.size() || numCorrectIngrPosRev == currentOrderRecipe.size()) && userSelectedIngrs.size() == currentOrderRecipe.size():
		emit_signal("show_completion_feedback", true)
	else:
		emit_signal("show_completion_feedback", false)

#_________________________________signal functions__________________________________________________

# recieves global signal of ingredient button with the name of the selected ingredient
func ingredient_selected (ingrName, ingrImg) -> void:
	print("recieved ingredient selection: ", ingrName)
	addIngredient(ingredientContainer, ingredientScene, ingrName, ingrImg)
	checkSelectedIngr(ingrName)

# recieves current order signal
func _on_order_area_update_recipe(recipe) -> void:
	currentOrderRecipe = recipe
	recipeIngrIndxRev = recipe.size() - 1
	print("recieved current order recipe: ", recipe)

# recieves completion signal
func _on_completion_bell_pressed() -> void:
	print("recieved order complete signal in crafting area")
	checkCorrectCompletion()
	emit_signal("request_updated_order")
	clearIngredients()

func _on_trash_can_pressed() -> void:
	clearIngredients()

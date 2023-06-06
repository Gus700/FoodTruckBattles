extends Control

@export var orderTypes: Array[Resource]
@onready var cardScene :PackedScene = preload("res://scenes/OrderCard.tscn") #packed scene of order card scene
@onready var currOrderContainer = $TabContainer/order #Node that holds the current order
@onready var nextOrdersContainer = $TabContainer2/upcoming #Node that holds all other orders
@onready var recipeDisplay = $TabContainer/recipe/Label
var requiredOrderNum: int
var orderNum: int

signal update_recipe(recipe: Array[String])
signal all_orders_complete()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setOrderInfo(getCurrOrder()) #set curent order
	setRecipeTab(getCurrOrder().getRecipe()) #set the recipe tab display
	for orderC in getNextOrders(): #set all other orders
		setOrderInfo(orderC)
	emit_signal("update_recipe", getCurrOrder().getRecipe()) #send signal of current recipe needed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#__________________________________regular functions________________________________________________

# set any required information for the Order Scenes
func setOrderInfo(orderScene) -> void:
	# get a random order type index in the resource array
	var randOrderType = orderTypes[randi_range (0, orderTypes.size()-1)]
	# set the image and recipe of the randomly picked order type to the order card
	orderScene.setImg(randOrderType.mainTexture)
	orderScene.setRecipe(randOrderType.recipe)

func setRecipeTab(ingredients: Array[String]) -> void:
	for string in ingredients:
		recipeDisplay.text += string + "\n"

# get reference to to the current order
func getCurrOrder() -> Node:
	return currOrderContainer.get_child(0)

# get reference to the next order following the current order
func getNextOrder() -> Node:
	return nextOrdersContainer.get_child(0)

# get a list of references to all other orders that are not the current one
func getNextOrders() -> Array[Node]:
	var orders: Array[Node] = []
	for order in nextOrdersContainer.get_children():
		orders.append(order)
	return orders

func clearRecipeTab() -> void:
	recipeDisplay.text = ""

# creates an instance of a new Order Node
func createNewOrder() ->Node:
	var newOrder = cardScene.instantiate() #make a new card order
	setOrderInfo(newOrder)
	return newOrder

# replace the current order with a new one, returns the replaced order Node
func replaceCurrOrder(newCurrOrder: Node) -> Node:
	var oldCurrOrder = getCurrOrder()
	currOrderContainer.remove_child(oldCurrOrder)
	nextOrdersContainer.remove_child(newCurrOrder)
	currOrderContainer.add_child(newCurrOrder)
	setRecipeTab(getCurrOrder().getRecipe())
	return oldCurrOrder

# function called to complete the current order
func completeCurrOrder() -> void:
	clearRecipeTab()
	if nextOrdersContainer.get_child_count() != 0:
		var oldOrder = replaceCurrOrder(getNextOrder())
		oldOrder.queue_free()
	elif currOrderContainer.get_child_count() != 0:
		getCurrOrder().queue_free()

#__________________________________Signal functions_______________________________________________

#recieves message from crafting area that next order info is needed
func _on_crafting_area_request_updated_order() -> void:
	if nextOrdersContainer.get_child_count() != 0:
		emit_signal("update_recipe", getNextOrder().getRecipe()) #signal info of the next order recipe
	completeCurrOrder()
	#if nextOrdersContainer.get_child_count() == 0 && currOrderContainer.get_child_count() == 0:
		#emit_signal("all_orders_complete")

func _on_completion_bell_pressed() -> void:
	if nextOrdersContainer.get_child_count() == 0 && currOrderContainer.get_child_count() == 0:
		emit_signal("all_orders_complete")

extends HBoxContainer

@export var orderTypes: Array[Resource]

var requiredOrderNum: int
var orderNum: int
var cardScene

signal update_recipe(recipe: Array[String])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cardScene = preload("res://scenes/OrderCard.tscn")
	for orderCard in get_children():
		# set random order type index in the resource array
		var randOrderNum: int = randi_range (0, orderTypes.size()-1)
		# set the image and recipe of the randomly picked order type to the order card
		orderCard.get_node("OrderImage").texture = orderTypes[randOrderNum].mainTexture
		orderCard.recipe = orderTypes[randOrderNum].ingredients
		
	#send signal of current order ingredients
	emit_signal("update_recipe", get_child(0).recipe)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#recieves message from crafting area that next order info is needed
func _on_crafting_area_request_updated_order() -> void:
	get_child(0).queue_free() #free the current order
	emit_signal("update_recipe", get_child(0).recipe) #send info of new current order
	var cardSceneInst = cardScene.instantiate() #make a new card order
	var randOrderNum: int = randi_range (0, orderTypes.size()-1)
	cardSceneInst.get_node("OrderImage").texture = orderTypes[randOrderNum].mainTexture
	cardSceneInst.recipe = orderTypes[randOrderNum].ingredients
	add_child(cardSceneInst)
	pass # Replace with function body.

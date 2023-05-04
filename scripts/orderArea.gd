extends HBoxContainer

@export var orderTypes: Array[Resource]

var requiredOrderNum: int
var orderNum: int

signal update_recipe(recipe: Array[String])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	# if ordernum < requiredOrderNum
	pass

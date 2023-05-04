extends TextureButton

@export var itemName: String

#custom signals should be in snake case
signal ingredient_selected(ingredientName)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_pressed() -> void:
	emit_signal("ingredient_selected", itemName)

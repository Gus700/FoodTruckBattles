extends SceneScr

var currentFoodTruck: String = GloData.getCurrLvlName()

func _ready() -> void:
	get_node(currentFoodTruck).show()

#_________________________signal functions______________________________________

func _on_texture_button_get_dest(dest) -> void:
	emit_signal("scene_changed", dest)


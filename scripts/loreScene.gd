extends SceneScr

var currentFoodTruck: String = GloData.getCurrLvlName()

#_________________________signal functions______________________________________

func _on_texture_button_get_dest(dest) -> void:
	emit_signal("scene_changed", dest)

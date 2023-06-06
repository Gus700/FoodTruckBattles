extends TextureButton

class_name ChangeSceneButtonScr

@export var dest : String = "level"

signal get_dest(dest)

func _on_pressed():
	emit_signal("get_dest",dest)

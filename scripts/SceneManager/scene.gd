extends Control

class_name SceneScr

signal scene_changed(dest)

func _on_change_scene_button_get_dest(dest):
	emit_signal("scene_changed",dest)

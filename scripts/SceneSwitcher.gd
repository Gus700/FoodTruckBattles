extends Node

@onready var current_scene = $"Main Menu"

func _ready() -> void:
	current_scene.connect("scene_changed", Callable(self,"handle_scene_changed"))

func handle_scene_changed(dest_scene: String):
	var next_scene
	
	next_scene = load("res://scenes/" + dest_scene +".tscn").instantiate()
	add_child(next_scene)
	next_scene.connect("scene_changed", Callable(self,"handle_scene_changed"))
	current_scene.queue_free()
	current_scene = next_scene

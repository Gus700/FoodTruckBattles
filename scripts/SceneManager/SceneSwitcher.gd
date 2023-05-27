extends Node

var next_scene = null

@onready var current_scene = $"Main Menu"
@onready var ani_player = $"AnimationPlayer"

func _ready() -> void:
	current_scene.connect("scene_changed", Callable(self,"handle_scene_changed"))

func handle_scene_changed(dest_scene: String):
	
	next_scene = load("res://scenes/" + dest_scene +".tscn").instantiate()
	add_child(next_scene)
	next_scene.z_index = -1
	ani_player.play("FadeOut")
	next_scene.connect("scene_changed", Callable(self,"handle_scene_changed"))
func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"FadeOut":
			current_scene.queue_free()
			current_scene = next_scene
			current_scene.z_index = 1
			next_scene = null
			ani_player.play("FadeIn")

extends TextureRect

@onready var truck_anim = $TruckFader

var trucks = ["res://assets/trucks/angel_food.png",
"res://assets/trucks/bury_me.png",
"res://assets/trucks/capybara.png",
"res://assets/trucks/cheddorbendor.png",
"res://assets/trucks/corn_dog.png",
"res://assets/trucks/devils_tango.png",
"res://assets/trucks/frosty_friends.png"]

var positionRandomizer = RandomNumberGenerator.new()


func _on_timer_timeout():
	positionRandomizer.randomize()
	self.texture = load(trucks.pick_random())
	self.position.x = positionRandomizer.randi_range(0,DisplayServer.window_get_size().x - 300)
	self.position.y = positionRandomizer.randi_range(0,DisplayServer.window_get_size().y - 300)
	truck_anim.play("FadeInTruck")

func _on_truck_fader_animation_finished(anim_name):
	match anim_name:
		"FadeOutTruck":
			$Timer.start(0.05)
		"FadeInTruck":
			truck_anim.play("FadeOutTruck")

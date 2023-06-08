extends Control

@export var timeNeeded: int = 120
@onready var timer :Node = $Timer
@onready var progressBar :Node = $TextureRect/ProgressBar
@onready var waitTimeUnit:float 
signal game_over()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(timeNeeded)
	waitTimeUnit = (1 - progressBar.anchor_left) /timer.wait_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	resizeProgressBar(timer.time_left)

#______________________normal functions_________________________________________

func resizeProgressBar(timeLeft) -> void:
	var newLAnchor :float = 1 - (timeLeft * waitTimeUnit)
	progressBar.set_anchor(SIDE_LEFT, newLAnchor, true)

func pauseTimer() -> void:
	timer.paused = true
	
func unpauseTimer() -> void:
	timer.paused = false
#______________________signal functions_________________________________________


func _on_timer_timeout() -> void:
	emit_signal("game_over")
	print("over")
	pass # Replace with function body.

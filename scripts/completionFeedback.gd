extends Control

@onready var correctNode = $Correct
@onready var wrongNode = $Wrong
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#_____________________________________regular functions__________________________

func showCorrectFeedback() ->void:
	correctNode.show()
	$Timer.start()

func showWrongFeedback() ->void:
	wrongNode.show()
	$Timer.start()


func _on_timer_timeout() -> void:
	correctNode.hide()
	wrongNode.hide()

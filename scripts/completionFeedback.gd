extends Control

@onready var correctNode = $Correct
@onready var wrongNode = $Wrong
signal DingBaded()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


#_____________________________________regular functions__________________________

func showCorrectFeedback() ->void:
	correctNode.show()
	$Timer.start()

func showWrongFeedback() ->void:
	emit_signal('DingBaded')
	wrongNode.show()
	$Timer.start()


func _on_timer_timeout() -> void:
	correctNode.hide()
	wrongNode.hide()

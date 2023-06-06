extends Control

@onready var stepNodes = $Steps
@onready var numSteps :int = stepNodes.get_child_count()
var currStepIndx :int = 0
var lastStepIndx :int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stepNodes.get_child(currStepIndx).show()
	print(numSteps)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#_______________________signal functions________________________________________

func _on_close_tutorial_pressed() -> void:
	self.hide()


func _on_next_button_pressed() -> void:
	if currStepIndx != numSteps - 1:
		lastStepIndx = currStepIndx
		currStepIndx += 1
		currStepIndx = fposmod(currStepIndx, numSteps)
		print(currStepIndx)
		stepNodes.get_child(currStepIndx).show()
		stepNodes.get_child(lastStepIndx).hide()
	


func _on_back_button_pressed() -> void:
	if currStepIndx != 0:
		lastStepIndx = currStepIndx
		currStepIndx -= 1
		currStepIndx = fposmod(currStepIndx, numSteps)
		print(currStepIndx)
		stepNodes.get_child(currStepIndx).show()
		stepNodes.get_child(lastStepIndx).hide()

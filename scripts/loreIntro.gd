extends Control

@onready var scns = $Scns
@onready var numScns = scns.get_child_count()
var currScnIndx :int = 0
var prevScnIndx :int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#______________________________signal functions_________________________________

func _on_next_button_pressed() -> void:
	if currScnIndx != numScns-1:
		prevScnIndx = currScnIndx
		currScnIndx += 1
		currScnIndx = fposmod(currScnIndx, numScns)
		print(currScnIndx)
		scns.get_child(currScnIndx).show()
		scns.get_child(prevScnIndx).hide()


func _on_back_button_pressed() -> void:
	if currScnIndx != 0:
		prevScnIndx = currScnIndx
		currScnIndx -= 1
		currScnIndx = fposmod(currScnIndx, numScns)
		print(currScnIndx)
		scns.get_child(currScnIndx).show()
		scns.get_child(prevScnIndx).hide()

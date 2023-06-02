extends Control


@onready var gameOverOverLay = $GameOverOverlay
@onready var completionFeedBack = $CompletionFeedback
@onready var timerBar = $EnemyProgress
@export var tutorialDisplay: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_progress_game_over() -> void:
	gameOverOverLay.show()


func _on_crafting_area_show_completion_feedback(isCorrect) -> void:
	if isCorrect == true:
		completionFeedBack.showCorrectFeedback()
	else:
		completionFeedBack.showWrongFeedback()


func _on_tutorial_overlay_draw() -> void:
	timerBar.pauseTimer()


func _on_tutorial_overlay_hidden() -> void:
	timerBar.unpauseTimer()

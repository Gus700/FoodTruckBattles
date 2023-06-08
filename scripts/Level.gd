extends SceneScr

@onready var levelComplete = $CompletionScreen
@onready var gameOverOverLay = $GameOverScreen
@onready var completionFeedBack = $CompletionFeedback
@onready var timerBar = $EnemyProgress
@export var currentLevelName: String = "LevelTutorial"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#_____________________________________signal functions______________________________________________

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


func _on_order_area_all_orders_complete() -> void:
	levelComplete.show()


func _on_try_again_get_dest(dest) -> void:
	emit_signal("scene_changed", dest)


func _on_quit_get_dest(dest) -> void:
	emit_signal("scene_changed", dest)


func _on_next_get_dest(dest) -> void:
	GloData.etCurrLvlName(currentLevelName)
	emit_signal("scene_changed", dest)


func _on_truck_intro_draw() -> void:
	timerBar.pauseTimer()


func _on_truck_intro_hidden() -> void:
	timerBar.unpauseTimer()

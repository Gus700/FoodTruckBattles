extends Control

@onready var allIngredients: Array[String]
@export var containers: Array[String]

func _on_sent_ingredients(ingredients):
	for r in ingredients:
		for i in r:
			if not allIngredients.has(i):
				allIngredients.append(i)
				

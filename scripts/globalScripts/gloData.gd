extends Node

var currentlevelName: String = ""

var levels = {
	"levelTutorial": {"introSeen": false},
	"level1": {"introSeen": false},
	"level2": {"introSeen": false},
	"level3": {"introSeen": false},
	"level4": {"introSeen": false},
	"level5": {"introSeen": false},
	"level6": {"introSeen": false},
	"level7": {"introSeen": false},
	"level8": {"introSeen": false},
}

func setCurrLvlName(lvlName: String) -> void:
	currentlevelName = lvlName

func getCurrLvlName() -> String:
	return currentlevelName

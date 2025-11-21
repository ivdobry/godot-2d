class_name GameController
extends Node

@export var game: GameData

var _route: String = "user://game.tres"

func save_game():
	game.level = GlobalController.level
	game.deaths = GlobalController.deaths
	
	ResourceSaver.save(game, _route)
	
func load_game():
	if ResourceLoader.exists(_route):
		game = load(_route)
		
		GlobalController.level = game.level
		GlobalController.deaths = game.deaths

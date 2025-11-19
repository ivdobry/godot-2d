extends Node

signal deaths_update

var deaths: int

func add_death() -> void:
	deaths += 1
	deaths_update.emit()

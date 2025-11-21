extends Node2D

@export var levels: Array[PackedScene]
@export var game_controller: GameController

var _actual_level: int = 1
var _instantiated_level: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalController.level > 1:
		_load_level()
	else:
		_create_level(_actual_level)

func _create_level(level: int):
	_instantiated_level = levels[level - 1].instantiate()
	add_child(_instantiated_level)
	
	var children := _instantiated_level.get_children()
	for child in children.size():
		if children[child].is_in_group("players"):
			children[child].dead_player.connect(_reset_level)
			break
			
	GlobalController.level = level
	game_controller.save_game()
		

func _destroy_level() -> void:
	_instantiated_level.queue_free()

func _reset_level() -> void:
	_destroy_level()
	_create_level.call_deferred(_actual_level)
	
func next_level() -> void:
	_actual_level += 1
	_destroy_level()
	_create_level.call_deferred(_actual_level)
	
func _load_level():
	_actual_level = GlobalController.level
	_create_level.call_deferred(_actual_level)

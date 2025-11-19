extends Node2D

@export var area_2d: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(_collect)

func _collect(_body):
	queue_free()

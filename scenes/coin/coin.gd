extends Node2D

@export var area_2d: Area2D

var coin_container: CoinContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(_collect)

func _collect(_body):
	coin_container.coin_collected()
	queue_free()

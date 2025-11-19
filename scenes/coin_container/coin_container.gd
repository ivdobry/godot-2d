class_name CoinContainer
extends Node

var _total_coins: int
var _coins_collected: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var coins := get_children()
	_total_coins = coins.size()
	
	for coin in coins:
		coin.coin_container = self

func coin_collected() -> void:
	_coins_collected += 1
	
	if _coins_collected == _total_coins:
		get_parent().get_parent().next_level()

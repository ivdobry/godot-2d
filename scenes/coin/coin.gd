extends Node2D

@export var area_2d: Area2D
@export var audio: AudioStreamPlayer2D

var coin_container: CoinContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(_collect)
	_init_animation()

func _collect(_body) -> void:
	coin_container.coin_collected()
	audio.reparent(get_parent().get_parent().get_parent())
	audio.play()
	queue_free()

func _init_animation() -> void:
	var tween: Tween = create_tween()
	tween.set_loops(0)
	tween.tween_property(self, "position:y", position.y -5, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:y", position.y +5, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)

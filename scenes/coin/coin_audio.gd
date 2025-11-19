extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finished.connect(_destroy)

func _destroy() -> void:
	queue_free()

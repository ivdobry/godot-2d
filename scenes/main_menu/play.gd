extends Button

@export var main_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_play, 4)


func _play() -> void:
	get_tree().change_scene_to_packed(main_scene)

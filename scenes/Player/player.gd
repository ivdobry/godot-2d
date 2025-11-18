extends CharacterBody2D

var _velocity: float = 100.0
var _jump_velocity: float = -300.0

func _physics_process(delta: float) -> void:
	# Gravityd 
	velocity += get_gravity() * delta
	
	# Jump
	if Input.is_action_just_pressed("ui_accept") && is_on_floor():
		velocity.y = _jump_velocity 
	
	# Lateral movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = _velocity
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -_velocity
	else:
		velocity.x = 0
	move_and_slide()

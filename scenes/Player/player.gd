extends CharacterBody2D

@export var animation: AnimatedSprite2D

var _velocity: float = 100.0
var _jump_velocity: float = -300.0

func _physics_process(delta: float) -> void:
	# Gravityd 
	velocity += get_gravity() * delta
	
	# Jump
	if (Input.is_action_just_pressed("jump") || Input.is_action_just_pressed("ui_accept")) && is_on_floor():
		velocity.y = _jump_velocity 
	
	# Lateral movement
	if Input.is_action_pressed("right"):
		velocity.x = _velocity
		animation.flip_h = true
	elif Input.is_action_pressed("left"):
		velocity.x = -_velocity
		animation.flip_h = false
	else:
		velocity.x = 0
	move_and_slide()
	
	# Animation
	if !is_on_floor():
		animation.play("jump")
	elif velocity.x != 0:
		animation.play("running")
	else:
		animation.play("idle")

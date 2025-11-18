extends CharacterBody2D

signal dead_player

@export var animation: AnimatedSprite2D
@export var area_2d: Area2D
@export var player_material_red: ShaderMaterial

var _velocity: float = 100.0
var _jump_velocity: float = -300.0
var _dead: bool

func _ready() -> void:
	add_to_group("players")
	area_2d.body_entered.connect(_on_area_2d_body_entered)

func _physics_process(delta: float) -> void:
	if _dead:
		return
		
	# Gravityd 
	velocity += get_gravity() * delta
	
	# Jump
	if Input.is_action_just_pressed("jump") && is_on_floor():
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
		
func _on_area_2d_body_entered(_body: Node2D) -> void:
	animation.material = player_material_red
	_dead = true
	animation.stop()
	
	await get_tree().create_timer(0.5).timeout
	dead_player.emit()

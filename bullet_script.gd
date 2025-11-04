extends RigidBody2D

@export var speed: float = 1000  # Velocidade da bala
@export var direction: Vector2 = Vector2.RIGHT  # Direção padrão

func _ready() -> void:
	mass = 2
	gravity_scale = 0.5
	linear_velocity = direction * speed

func _physics_process(delta):
	pass

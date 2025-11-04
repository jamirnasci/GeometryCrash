extends Camera2D

@export var follow_target: Node2D
@export var direction = Vector2.ZERO

func _ready() -> void:
	make_current()
	limit_left = 0
	limit_top = 0
	limit_right = 1700
	limit_bottom = 648

func _process(delta: float) -> void:
	position += direction * 100 * delta
	if follow_target:
		global_position = global_position.lerp(follow_target.global_position, 5.0 * delta)
	#else:
	#	global_position = global_position.lerp(Vector2(0, 0), 5.0 * delta)

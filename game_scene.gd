extends Node2D
	
@export var level_n: int = 5

var is_up_pressed = false	
var is_down_pressed = false	
var bullets_n = 10
	
func _ready() -> void:
	load_level()
	$CanvasLayer/HBoxContainer/BulletsN.text = str(bullets_n)
	#$Camera2D.follow_target = $Player

func load_level() -> void:
	var level_scene = load("res://levels/level%d.tscn" % level_n)
	var level = level_scene.instantiate()
	
	add_child(level)
	
@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	if(bullets_n <= 0):
		var end_game_scene = preload("res://end_game_scene.tscn")
		var end_game = end_game_scene.instantiate()
		end_game.level = level_n
		end_game.earned_coins = 100
		end_game.end_title = "Loss"
		
		get_tree().root.add_child(end_game)
		queue_free()
		
	$Player/PlayerSprite.rotation_degrees = clamp(
		$Player/PlayerSprite.rotation_degrees,
		-50,
		0
	)
	if(is_up_pressed):
		$Player/PlayerSprite.rotation_degrees -= 3
	if(is_down_pressed):
		$Player/PlayerSprite.rotation_degrees += 3
		
func shoot():
	var bullet_scene = preload("res://bullet_scene.tscn")
	bullets_n -= 1
	$CanvasLayer/HBoxContainer/BulletsN.text = str(bullets_n)
	var bullet = bullet_scene.instantiate()
	bullet.position = $Player/PlayerSprite.position
	var x = cos($Player/PlayerSprite.rotation)
	var y = sin($Player/PlayerSprite.rotation)	
	bullet.direction = Vector2(x, y)
	
	add_child(bullet)
	
	$Camera2D.follow_target = bullet
	await get_tree().create_timer(5).timeout
	$Camera2D.direction = Vector2(-10, 0)
	
func _on_down_button_pressed() -> void:
	$Player/PlayerSprite.rotation += 0.05
func _on_fire_button_pressed() -> void:
	shoot()

func _on_up_button_button_down() -> void:
	is_up_pressed = true
func _on_up_button_button_up() -> void:
	is_up_pressed = false
func _on_down_button_button_down() -> void:
	is_down_pressed = true
func _on_down_button_button_up() -> void:
	is_down_pressed = false
func _on_left_camera_pressed() -> void:
	$Camera2D.follow_target = null
	$Camera2D.direction = Vector2(-10, 0)
func _on_right_camera_pressed() -> void:
	$Camera2D.follow_target = null
	$Camera2D.direction = Vector2(10, 0)

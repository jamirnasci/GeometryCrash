extends Control

@export var end_title = "loss"
@export var earned_coins = 100
@export var level: int = 1

func _ready() -> void:
	$EndTitle.text = end_title.to_upper()
	$HBoxContainer/EarnedCoins.text = "Earned coins +%d" % earned_coins

func _on_play_again_button_pressed() -> void:
	var game_scene = load("res://game_scene.tscn")
	var game = game_scene.instantiate()
	game.level_n = level
	get_tree().root.add_child(game)
	queue_free()

func _on_levels_button_pressed() -> void:
	get_tree().change_scene_to_file("res://stages_scene.tscn")
	queue_free()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_scene.tscn")
	queue_free()

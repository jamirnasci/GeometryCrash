extends Control

var page_index = 0

func _ready() -> void:
	fill_grid()

func _on_level_pressed(level_n):
	var game_scene = preload("res://game_scene.tscn")
	var game = game_scene.instantiate()
	game.level_n = level_n
	get_tree().root.add_child(game)
	queue_free()
	
func fill_grid():
	var children = $CenterContainer/GridContainer.get_children()
	for child in children:
		$CenterContainer/GridContainer.remove_child(child)
		child.queue_free()
	
	for i in range(page_index * 10, (page_index * 10) + 10):
		var button = Button.new()
		button.text = str(i+1)
		button.name = "level_%d" % i
		button.custom_minimum_size = Vector2(100, 100)
		
		button.add_theme_font_size_override("font_size", 32)
		button.connect("pressed", Callable(self, "_on_level_pressed").bind(i + 1))
		$CenterContainer/GridContainer.add_child(button)

func _on_previous_button_pressed() -> void:
	if page_index > 0:
		page_index -= 1
	fill_grid()
func _on_next_button_pressed() -> void:
	if page_index < 2:
		page_index += 1
	fill_grid()

extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://stages_scene.tscn")

func _on_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://shop_scene.tscn")

func _on_exit_button_pressed() -> void:
	pass

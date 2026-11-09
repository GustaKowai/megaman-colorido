extends MarginContainer

@export var options_menu : PackedScene


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://fases/level_selection.tscn")

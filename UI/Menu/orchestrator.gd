extends Node

@onready var main_menu = $Main_menu
@onready var options_menu = $Options_menu

#Seção principal
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://fases/main_scene.tscn")

func _on_options_button_pressed() -> void:
	main_menu.visible = false
	options_menu.visible = true
	
	
func _on_exit_button_pressed() -> void:
	get_tree().quit()
	

#Seção opções
func _on_back_button_pressed() -> void:
	main_menu.visible = true
	options_menu.visible = false
	

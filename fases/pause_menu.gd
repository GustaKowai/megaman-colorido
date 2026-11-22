extends Window
@onready var main_section: ColorRect = $Main_section
@onready var options_menu: Control = $Options_menu
@onready var check_box: CheckBox = $Options_menu/CheckBox
@onready var check_box_2: CheckBox = $Options_menu/CheckBox2

func _ready() -> void:
	if DisplayServer.WINDOW_MODE_FULLSCREEN || DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
		#check_box.toggle_mode = true
		check_box.button_pressed = true
	if DisplayServer.WINDOW_MODE_WINDOWED: 
		#check_box.toggle_mode = false
		check_box.button_pressed = false
	check_box_2.button_pressed = GameManager.pulo_controlavel
	
func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	visible = false


func _on_options_button_pressed() -> void:
	options_menu.visible = true
	main_section.visible = false


func _on_level_selection_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://fases/main_scene.tscn")


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/Menu/Orchestrator.tscn")


func _on_back_button_pressed() -> void:
	options_menu.visible = false
	main_section.visible = true


func _on_check_box_toggled(toggled_on: bool) -> void:
	GameManager.is_fullscreen = toggled_on
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_check_box_2_toggled(toggled_on: bool) -> void:
	GameManager.pulo_controlavel = toggled_on

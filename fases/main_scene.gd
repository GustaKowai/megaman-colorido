extends Node2D
var current_level:Node2D
@onready var game_over_window = $Game_over_window
@onready var pause_menu: Window = $Pause_menu

@export var level_list:Array[PackedScene]
var current_level_number:int = 0
@export var resume_button: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	current_level = get_node("LevelRoot")
	_load_level(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _load_level(level_number:int)->void:
	current_level_number = level_number
	if current_level:
		current_level.queue_free()
	# Change Level:
	current_level = level_list[level_number].instantiate()
	add_child(current_level)
	current_level.name = "LevelRoot"
	_setup_level(current_level)
	
	
func _setup_level(level_root:Node):
	var exits = level_root.get_node_or_null("Exits")
	if exits:
		for exit in exits.get_children():
			exit.exit_level.connect(_on_exit_exit_level)
			#print_debug(exit)
	var player:Player = level_root.get_node_or_null("Protagonista")
	#print_debug(player)
	if player:
		print_debug("jogador encontrado")
		player.game_over.connect(restart_game_over)

func _on_exit_exit_level(body,level_number):
	if body.is_in_group("Player"):
		print_debug(body)
		print_debug(level_number)
		call_deferred("_load_level",level_number)

func restart_game_over():
	game_over_window.visible = true
	#_load_level(current_level_number)


func _on_restart_level_pressed() -> void:
	game_over_window.visible = false
	_load_level(current_level_number)


func _on_level_selection_pressed() -> void:
	game_over_window.visible = false
	_load_level(0)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pausa"):
		pause_menu.visible = true
		get_tree().paused = true
		resume_button.grab_focus()

extends Node2D
var current_level:Node2D
@export var level_list:Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_level = get_node("LevelRoot")
	_load_level(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _load_level(level_number:int)->void:
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
			print_debug(exit)
		

func _on_exit_exit_level(body,level_number):
	if body.is_in_group("Player"):
		print_debug(body)
		print_debug(level_number)
		_load_level(level_number)

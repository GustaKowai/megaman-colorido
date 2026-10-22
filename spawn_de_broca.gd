extends Node2D
@onready var timer: Timer = $Timer
@export var enemy_scene:PackedScene
@export var min_spawn_time:float
@export var max_spawn_time:float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = randf_range(min_spawn_time,max_spawn_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print_debug("invoquei")
	timer.wait_time = randf_range(min_spawn_time,max_spawn_time)
	var enemy:Enemy = enemy_scene.instantiate()
	enemy.transform = global_transform
	get_tree().get_first_node_in_group("Fase").add_child(enemy)

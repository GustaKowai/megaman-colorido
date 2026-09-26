extends AnimatedSprite2D
@export var speed:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug("fui criada")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print_debug("sai")
	queue_free()


func _on_damage_box_dealed_damage() -> void:
	queue_free()

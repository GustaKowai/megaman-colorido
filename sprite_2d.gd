extends Sprite2D
var movimento_lateral:float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if movimento_lateral <=1.0:
		get_material().set_shader_parameter("player_position",movimento_lateral)
		movimento_lateral += delta
	else:
		movimento_lateral = 0

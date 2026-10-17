extends Bullet
var speedy:float = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity_vector")

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * speed * delta + transform.y * speedy
	speedy += gravity.y * delta

extends AnimatableBody2D
@export var time_moving:float
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = time_moving


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#move_and_collide(Vector2(0,110))
	pass


func _on_timer_timeout() -> void:
	constant_linear_velocity.x *= -1

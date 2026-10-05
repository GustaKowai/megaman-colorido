extends State
class_name Dash

@export var dash_speed:float
@export var dash_time_max:float
var dash_time:float
@export var dash_cooldown_max:float
var dash_cooldown:float

func Enter():
	dash_time = dash_time_max
		
func Physics_update(delta: float):
	if dash_cooldown >= 0:
		print_debug(dash_cooldown)
		Transitioned.emit(self,"idle")
	else:
		dash_time -= delta
		#var direction := Input.get_axis("ui_left", "ui_right")
		if target.sprite.flip_h:
			target.velocity.x = -1 * dash_speed
		else:
			target.velocity.x = dash_speed
		if dash_time <= 0:
			target.velocity.x = 0
			dash_cooldown = dash_cooldown_max
			Transitioned.emit(self,"idle")

func _physics_process(delta: float) -> void:
	if dash_cooldown >= 0:
		dash_cooldown -= delta
	else:
		pass

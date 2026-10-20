extends IdleEnemy
@onready var player_col: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer

func Enter():
	print_debug("Thwomp Idle to fall")
	super()
	enemy.add_collision_exception_with(player_col)
	if timer:
		timer.start()

func _on_timer_timeout():
	Transitioned.emit(self,"Fall")

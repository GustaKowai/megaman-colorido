extends IdleEnemy
@onready var timer: Timer = $Timer


func Enter():
	super()
	timer.start()
	
	
func _on_timer_timeout() -> void:
	Transitioned.emit(self, "dash")

func Physics_update(_delta: float):
	if not target.is_on_floor():
		Transitioned.emit(self, "fall")

extends DamageState
@onready var timer: Timer = $Timer

func Enter():
	super()
	timer.start()
	
func Physics_update(_delta: float):
	pass
	
func _on_timer_timeout() -> void:
	Transitioned.emit(self,"fly")

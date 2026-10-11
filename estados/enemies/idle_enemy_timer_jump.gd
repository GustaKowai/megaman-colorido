extends IdleEnemy
@onready var timer: Timer = $Timer

func Enter():
	super()
	if timer:
		timer.start()


func _on_timer_timeout() -> void:
	Transitioned.emit(self,"Jump")

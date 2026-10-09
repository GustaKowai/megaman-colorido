extends IdleEnemy

@onready var timer: Timer = $Timer


func Enter():
	#print_debug("Idle timer")
	super()
	if timer:
		timer.start()

func _on_timer_timeout():
	Transitioned.emit(self,"Walk")

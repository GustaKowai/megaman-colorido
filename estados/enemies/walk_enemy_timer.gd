extends WalkEnemy

@onready var timer: Timer = $Timer

func Enter():
	direction *= -1
	super()
	timer.start()


func _on_timer_timeout() -> void:
	#print_debug("timeout pro idle")
	Transitioned.emit(self,"Idle")

extends IdleEnemy

@onready var timer: Timer = $Timer
var walk_jump : bool = true


func Enter():
	#print_debug("Idle timer")
	super()
	if timer:
		timer.start()

func _on_timer_timeout():
	#print_debug("timeout")
	if walk_jump : 
		walk_jump = false
		Transitioned.emit(self,"Jump")
	else:
		walk_jump = true
		Transitioned.emit(self,"Walk")

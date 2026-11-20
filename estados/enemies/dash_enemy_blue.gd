extends DashEnemy

func _on_timer_timeout():
	Transitioned.emit(self, "idle")

func Enter():
	direction *= -1
	target.just_damaged = true
	super()

func Exit():
	target.just_damaged = false
	super()

extends DashEnemy

func _on_timer_timeout():
	Transitioned.emit(self, "idle")

func Enter():
	direction *= -1
	super()

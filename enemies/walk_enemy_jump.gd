extends WalkEnemy
@onready var timer: Timer = $Timer

func Exit():
	pass
	
func Enter():
	direction *= -1
	super()
	timer.start()

func _on_timer_timeout() -> void:
	Transitioned.emit(self,"jump")

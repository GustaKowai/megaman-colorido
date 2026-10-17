extends DamageState
@onready var timer: Timer = $Timer

func Enter():
	super()
	timer.start()
	
	


func _on_timer_timeout() -> void:
	Transitioned.emit(self,"idle")

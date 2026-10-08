extends WalkEnemy
@onready var timer = $Timer


func Enter(): 
	print_debug("walk")
	direction = -direction
	super()
	timer.start()

func _on_timer_timeout():
	Transitioned.emit(self,"shield")

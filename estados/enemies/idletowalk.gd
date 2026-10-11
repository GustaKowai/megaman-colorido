extends IdleEnemy
@onready var hurt_box: HurtBox = $"../../HurtBox"

@onready var timer: Timer = $Timer


func Enter():
	#print_debug("Idle timer")
	super()
	hurt_box.get_child(0).disabled = true
	if timer:
		timer.start()
	
	
	
func _on_timer_timeout():
	Transitioned.emit(self,"Walk")

func Exit():
	hurt_box.get_child(0).disabled = false
	super()
	

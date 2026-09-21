extends State
class_name WalkEnemy

@export var enemy:Enemy
@onready var timer: Timer = $Timer
var walk_jump : bool

func Enter():
	print_debug("state transition ong")
	if enemy.sprite:
		enemy.sprite.play("idle")
	if timer:
		timer.start()
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	pass


func _on_timer_timeout():
	if walk_jump : 
		walk_jump = false
		Transitioned.emit(self,"Jump")
	else:
		walk_jump = true
		Transitioned.emit(self,"Walk")

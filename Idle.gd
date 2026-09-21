extends State
class_name WalkEnemy

@export var enemy:Enemy
@onready var timer = $"../../Timer"

func Enter():
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
	Transitioned.emit(self,"Jump")

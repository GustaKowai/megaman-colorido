extends State
class_name IdleEnemy

@export var enemy:Enemy

func Enter():
	print_debug("Idle geral")
	if enemy.sprite:
		enemy.sprite.play("idle")
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	pass

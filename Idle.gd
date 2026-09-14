extends State
class_name WalkEnemy
@export var enemy:Enemy

func Enter():
	if enemy.sprite:
		enemy.sprite.play("idle")
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	pass

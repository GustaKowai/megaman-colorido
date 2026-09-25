extends State
class_name WalkEnemy

@export var enemy:Enemy
var direction = 1

func Enter():
	if enemy.sprite:
		enemy.sprite.play("walk")
		
func Exit():
	enemy.velocity.x = 0
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	enemy.velocity.x = direction * enemy.speed
	if not enemy.is_on_floor():
		Transitioned.emit(self,"Fall")

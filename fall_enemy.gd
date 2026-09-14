extends State
class_name FallEnemy
@export var enemy:Enemy

func Enter():
	if enemy.sprite:
		enemy.sprite.play("fall")
		
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	enemy.velocity += enemy.get_gravity() * _delta
	if enemy.is_on_floor():
		Transitioned.emit(self,"Idle")

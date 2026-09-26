extends State
class_name WalkEnemy

var enemy:Enemy
var direction = 1

func _ready() -> void:
	super()
	enemy = target

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

func _on_hurt_box_damaged() -> void:
	Transitioned.emit(self,"damage")

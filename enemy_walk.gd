extends State
class_name EnemyWalk
@export var enemy:Enemy
@onready var timer: Timer = $Timer
var direction = 1

func Enter():
	timer.start()
	if enemy.sprite:
		enemy.sprite.play("walk")
		
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	enemy.velocity.x = direction * enemy.SPEED
	##if enemy.is_on_wall():
		##direction = -direction


func _on_timer_timeout() -> void:
	print_debug("timeout pro idle")
	enemy.velocity.x = 0
	Transitioned.emit(self,"Idle")

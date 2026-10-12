extends WalkEnemy

@onready var timer: Timer = $Timer

func Enter():
	direction *= -1
	super()
	timer.start()

func Physics_update(_delta: float):
	enemy.velocity.x = direction * enemy.speed
	enemy.velocity.y = direction * enemy.speed
	
func Exit():
	super()
	enemy.velocity.y = 0


func _on_timer_timeout() -> void:
	Transitioned.emit(self,"idle")

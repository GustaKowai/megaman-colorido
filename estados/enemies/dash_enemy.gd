extends WalkEnemy
@onready var timer = $Timer

func Enter():
	super()
	if enemy.sprite:
		enemy.sprite.play("dash")
	timer.start()

func Physics_update(_delta: float):
	enemy.velocity.x = direction * enemy.speed * 6


func _on_timer_timeout():
	Transitioned.emit(self, "walk")

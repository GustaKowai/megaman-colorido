extends WalkEnemy
var dir:Vector2
func Enter():
	dir = Vector2.from_angle(target.rotation)
	enemy.velocity = enemy.speed * dir


func Physics_update(_delta: float):
	pass

func Exit():
	target.velocity = Vector2(0,0)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	target.rotation *= -1
	enemy.velocity = enemy.speed * dir

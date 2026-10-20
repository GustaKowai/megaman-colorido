extends FallEnemy

func Physics_update(_delta: float):
	#print_debug("caindo?", enemy.velocity)
	enemy.velocity += enemy.get_gravity() * _delta
	if enemy.is_on_floor():
		Transitioned.emit(self,"Idletorise")

func _on_body_entered(body: Node2D) -> void:
	if body is Player || body is Enemy:
		Transitioned.emit(self,"Rise")

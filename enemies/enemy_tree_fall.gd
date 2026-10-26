extends FallEnemy

func Physics_update(_delta: float):
	#print_debug("caindo?", enemy.velocity)
	enemy.velocity += enemy.get_gravity() * _delta
	if enemy.is_on_floor():
		#print_debug("cai")
		Transitioned.emit(self,"Idletorise")


func _on_damage_area_dealed_damage() -> void:
	#print_debug("acertei alguem")
	Transitioned.emit(self,"Rise")


func _on_detect_enemy_body_entered(body: Node2D) -> void:
	#print_debug(body)
	if body is Enemy:
		#print_debug("acertei um inimigo")
		Transitioned.emit(self,"Rise")

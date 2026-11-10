extends WalkEnemy
var target_player:Player = null
var target_direction:Vector2 =  Vector2(1.0,0.0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print_debug("achei de verdade")
		target_player = body
	if not target_player:
		get_target()

func Enter():
	super()
	get_target()
	animated_sprite_2d.flip_h = target_direction.x < 0
	
func Exit():
	super()
	enemy.velocity.y = 0

func Physics_update(_delta: float):
	enemy.velocity = target_direction * enemy.speed


func get_target():
	if target_player:
		target_direction = (target_player.global_position - enemy.global_position)
		target_direction = target_direction.normalized()

func _on_timer_timeout() -> void:
	if target_player:
		Transitioned.emit(self,"Idle")
	else:
		target_direction *= -1
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h

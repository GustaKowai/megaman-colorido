extends State
class_name fall
@export var player:Player

func Enter():
	if player.animation_player:
		player.animation_player.play("jump")
		
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	player.velocity += player.get_gravity() * _delta
	if player.is_on_floor():
		Transitioned.emit(self,"idle")
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.SPEED
		player.sprite.flip_h = player.velocity.x < 0
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	if Input.is_action_just_pressed("shoot"):
		Transitioned.emit(self,"shoot")

extends State
class_name walk
@export var player:Player

func Enter():
	player.animation_player.play("walk")
		
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	if Input.is_action_just_pressed("ui_up") and player.is_on_floor():
		Transitioned.emit(self,"jump")
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.max_speed
		player.sprite.flip_h = player.velocity.x < 0
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.max_speed)
	if player.velocity.is_zero_approx():
		Transitioned.emit(self,"idle")
	if !player.is_on_floor():
		Transitioned.emit(self,"fall")
		
	if Input.is_action_just_pressed("shoot"):
		Transitioned.emit(self,"shoot")

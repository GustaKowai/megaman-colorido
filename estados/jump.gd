extends State
class_name jump
@export var player:Player

func Enter():
	if player.animation_player:
		player.animation_player.play("jump")
	player.velocity.y = player.JUMP_VELOCITY
		
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	#print_debug("Bluuuuuue")
	player.velocity += player.get_gravity() * _delta
	if player.is_on_floor():
		Transitioned.emit(self,"idle")
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.max_speed
		player.sprite.flip_h = player.velocity.x < 0
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.max_speed)
	if Input.is_action_just_pressed("shoot"):
		Transitioned.emit(self,"shoot")


func _on_hurt_box_damaged() -> void:
	Transitioned.emit(self,"damage")

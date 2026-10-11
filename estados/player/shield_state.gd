extends State
@export var shield_type:PackedScene
@export var shield_time_max:float
var shield_time

func Enter():
	#target.velocity *= 0
	shield_time = shield_time_max
	if target.is_in_group("Player"):
		target.animation_player.play("shield")
	if target.is_in_group("Enemy"):
		target.sprite.play("shield")
	var shield:Shield = shield_type.instantiate()
	shield.damage_to="Enemy"
	target.add_child(shield)
	
func Update(delta: float):
	shield_time -= delta
	if Input.is_action_just_released("action") or shield_time <= 0:
		end_shield()
	
func Physics_update(_delta: float):
	target.velocity += target.get_gravity() * _delta
	if Input.is_action_just_pressed("ui_up") and target.is_on_floor():
			target.velocity.y = target.JUMP_VELOCITY
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		target.velocity.x = direction * target.max_speed
		target.sprite.flip_h = target.velocity.x < 0
	else:
		target.velocity.x = move_toward(target.velocity.x, 0, target.max_speed)

func Exit():
	var childrens = target.get_children()
	for child in childrens:
		if child is Shield:
			child.queue_free()

func end_shield():
	if !target.is_on_floor():
		Transitioned.emit(self,"fall")
	if target.velocity.is_zero_approx():
		Transitioned.emit(self,"idle")
	else:
		Transitioned.emit(self,"walk")

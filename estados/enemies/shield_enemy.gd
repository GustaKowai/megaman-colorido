extends State
class_name ShieldEnemy

@export var shield_type:PackedScene
@export var shield_time_max:float
var shield_time

func Enter():
	target.velocity *= 0
	shield_time = shield_time_max
	if target.is_in_group("Player"):
		target.animation_player.play("shield")
	if target.is_in_group("Enemy"):
		target.sprite.play("shield")
	var shield:Shield = shield_type.instantiate()
	shield.damage_to="Player"
	target.add_child(shield)
	
func Update(delta: float):
	shield_time -= delta
	if shield_time <= 0:
		end_shield()
		
func end_shield():
	if !target.is_on_floor():
		Transitioned.emit(self,"fall")
	if target.velocity.is_zero_approx():
		Transitioned.emit(self,"idle")
	else:
		Transitioned.emit(self,"walk")
		
func Exit():
	var childrens = target.get_children()
	for child in childrens:
		if child is Shield:
			child.queue_free()

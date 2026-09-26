extends State
class_name DamageState
@export var target:CharacterBody2D
@export var damage_color:Color = Color(1.437, 1.437, 1.437)

func Enter():
	target.modulate = damage_color
	if target.is_in_group("Player"):
		target.animation_player.play("damage")
	if target.is_in_group("Enemy"):
		target.sprite.play("damage")
	print_debug(target.velocity)
	#await get_tree().create_timer(0.1).timeout
	#Transitioned.emit(self,"fall")
	
func Physics_update(_delta: float):
	target.velocity += target.get_gravity() * _delta
	if target.is_on_floor():
		print_debug("to no chão")
		Transitioned.emit(self,"idle")
func Exit():
	target.velocity.x = 0
	target.modulate = Color.WHITE

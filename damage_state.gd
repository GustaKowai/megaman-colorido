extends State
@export var target:CharacterBody2D

func Enter():
	target.animation_player.play("damage")
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

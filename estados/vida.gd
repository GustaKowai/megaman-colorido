extends Area2D
class_name HurtBox
signal damaged
signal healed
signal died

@export var target:CharacterBody2D
@export var max_life:int
@export var knockback:int
@export var invulnerability_time:float
var timer_for_invulnerability:float
var life

func _ready() -> void:
	life = max_life

func _process(delta: float) -> void:
	if target.just_damaged:
		print_debug(timer_for_invulnerability)
		timer_for_invulnerability -= delta
		if timer_for_invulnerability <= 0:
			target.just_damaged = false

func take_damage(damage:int,push_direction):
	print_debug(target.just_damaged)
	if target.just_damaged:
		return
	life -= damage
	if life <= 0:
		damaged.emit(0)
		die()
		queue_free()
		return
	#target.animation_player.play("damage")
	target.just_damaged = true
	timer_for_invulnerability = invulnerability_time
	damaged.emit(life)
	print_debug(life)
	target.velocity.x = push_direction*knockback/2
	target.velocity.y = -knockback

	#print_debug(push_direction," ", life," ", target.velocity)
	
func give_heal(heal:int):
	if life + heal <= max_life:
		life += heal
		healed.emit(life)
	else:
		life = max_life
		
func die():
	died.emit()

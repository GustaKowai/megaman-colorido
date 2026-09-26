extends Area2D
class_name HurtBox
signal damaged
signal died

@export var target:CharacterBody2D
@export var max_life:int
@export var knockback:int
var life

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	life = max_life

func take_damage(damage:int,push_direction):
	life -= damage
	if life <= 0:
		die()
		return
	#target.animation_player.play("damage")
	damaged.emit(life)
	print_debug(life)
	target.velocity.x = push_direction*knockback/2
	target.velocity.y = -knockback

	#print_debug(push_direction," ", life," ", target.velocity)
	
func give_heal(heal:int):
	if life + heal <= max_life:
		life += heal
	else:
		life = max_life
		
func die():
	died.emit()

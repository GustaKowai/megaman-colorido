extends Area2D
class_name HurtBox

@export var target:CharacterBody2D
@export var max_life:int
var life

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	life = max_life

func take_damage(damage:int,push_direction):
	life -= damage
	target.animation_player.play("damage")
	target.velocity.x = -push_direction*500
	target.velocity.y = -500
	print_debug(push_direction," ", life," ", target.velocity.x)
	
func give_heal(heal:int):
	if life + heal <= max_life:
		life += heal
	else:
		life = max_life
		
func die():
	target.animation_player.play("die")
	target.queue_free()

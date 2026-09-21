extends Node

@export var player:Player
@export var max_life:int
var life

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	life = max_life


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage(damage:int):
	life -= damage
	
func give_heal(heal:int):
	if life + heal <= max_life:
		life += heal
	else:
		life = max_life
		
func die():
	player.animation_player.play("die")

extends State
class_name WalkEnemy

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var enemy:Enemy
var direction = 1

func _ready() -> void:
	super()
	enemy = target

func Enter():
	if enemy.sprite:
		enemy.sprite.play("walk")
	animated_sprite_2d.flip_h = direction < 0
		
func Exit():
	enemy.velocity.x = 0
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	enemy.velocity.x = direction * enemy.speed
	if not enemy.is_on_floor():
		Transitioned.emit(self,"Fall")

func _on_hurt_box_damaged() -> void:
	Transitioned.emit(self,"damage")

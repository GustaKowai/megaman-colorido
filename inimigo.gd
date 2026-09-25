extends CharacterBody2D
class_name Enemy
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var speed = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	pass
func _process(_delta: float) -> void:
	pass
	

func _physics_process(_delta: float) -> void:
	move_and_slide()

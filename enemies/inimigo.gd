extends CharacterBody2D
class_name Enemy
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var speed = 300.0
const JUMP_VELOCITY = -400.0
var just_damaged:bool = false
@export var is_fliped:bool = false

func _ready() -> void:
	sprite.flip_h = is_fliped
	
func _process(_delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	move_and_slide()

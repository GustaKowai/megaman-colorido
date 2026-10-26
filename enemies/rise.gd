extends State
class_name ThumperEnemy
@onready var timer: Timer = $Timer

var enemy:Enemy

func _ready() -> void:
	super()
	enemy = target

func Enter():
	#print_debug("Thwomp Rise")
	if enemy.sprite:
		enemy.sprite.play("rise")
	enemy.velocity.y = -200
	if timer:
		timer.start()

func Physics_update(_delta: float):
	if enemy.position.y <= enemy.limite_subida:
		enemy.velocity.y = 0
		Transitioned.emit(self,"Idletofall")

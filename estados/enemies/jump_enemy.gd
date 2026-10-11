extends State
class_name JumpEnemy

var enemy:Enemy

func _ready() -> void:
	super()
	enemy = target

func Enter():
	if enemy.sprite:
		enemy.sprite.play("jump")
	enemy.velocity.y = enemy.JUMP_VELOCITY
	
func Physics_update(_delta: float):
	enemy.velocity += enemy.get_gravity() * _delta
	if enemy.is_on_floor():
		Transitioned.emit(self,"Idle")

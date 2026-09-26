extends State
class_name IdleEnemy

var enemy:Enemy

func _ready() -> void:
	super()
	enemy = target

func Enter():
	#print_debug("Idle geral")
	if enemy.sprite:
		enemy.sprite.play("idle")
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	pass

func _on_hurt_box_damaged() -> void:
	Transitioned.emit(self,"damage")

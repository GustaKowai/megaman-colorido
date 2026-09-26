extends Node
class_name State

@warning_ignore("unused_signal")
signal Transitioned

func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	pass

func _on_hurt_box_damaged() -> void:
	Transitioned.emit(self,"damage")
	
func _on_hurt_box_died() -> void:
	Transitioned.emit(self,"died")

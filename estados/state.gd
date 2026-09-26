extends Node
class_name State
@export var target:CharacterBody2D
@warning_ignore("unused_signal")
signal Transitioned

func _ready() -> void:
	#target.print_tree_pretty()
	var target_childrens = target.get_children()
	for children in target_childrens:
		if children is HurtBox:
			#print_debug("achei hurtBox ",name)
			children.damaged.connect(on_hurt_box_damaged)
			children.died.connect(on_hurt_box_died)

func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	pass

func on_hurt_box_damaged(_life) -> void:
	Transitioned.emit(self,"damage")
	
func on_hurt_box_died() -> void:
	Transitioned.emit(self,"died")

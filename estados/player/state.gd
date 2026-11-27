extends Node
class_name State
@export var target:CharacterBody2D
@warning_ignore("unused_signal")
signal Transitioned

func _ready() -> void:
	#target.print_tree_pretty()
	PlayerManager.change_UI_color.connect(exit_when_change_color)
	var target_childrens = target.get_children()
	for children in target_childrens:
		if children is HurtBox:
			#print_debug("achei hurtBox ",name)
			#get_parent().print_tree_pretty()
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
	if get_parent().can_process():
		print_debug("tomou dano")
		if _life >0:
			Transitioned.emit(self,"damage")
	
func on_hurt_box_died() -> void:
	#get_parent().print_tree_pretty()
	if get_parent().can_process():
		print_debug("morreu")
		#print_debug(get_parent())
		Transitioned.emit(self,"died")

		
func do_action():
	#print_debug(get_parent())
	match get_parent().name:
		"magent":
			Transitioned.emit(self,"shoot")
		"green":
			if target.is_on_floor():
				Transitioned.emit(self,"heal")
		"yellow":
			Transitioned.emit(self,"shield")
		"blue":
			Transitioned.emit(self,"dash")
		_:
			pass

func exit_when_change_color(arg):
	if get_parent().get_parent().is_in_group("Player"):
		Transitioned.emit(self,"idle")
		Exit()

extends State
class_name idle
@export var player:Player

func Enter():
	if player.sprite:
		#print_debug(player,player.sprite)
		player.animation_player.play("idle")
	#print_debug(get_parent())
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	if Input.is_action_just_pressed("ui_up") and player.is_on_floor():
		Transitioned.emit(self,"jump")
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		Transitioned.emit(self,"walk")
	if !player.is_on_floor():
		Transitioned.emit(self,"fall")
	if Input.is_action_just_pressed("shoot"):
		Transitioned.emit(self,"shoot")


func _on_hurt_box_damaged() -> void:
	Transitioned.emit(self,"damage")

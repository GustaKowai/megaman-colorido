extends State
@export var player:Player
@export var bullet:PackedScene
@onready var mira: Marker2D = $"../../Sprite2D/mira"


func Enter():
	if player.animation_player:
		player.animation_player.play("shoot")
		
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	if !player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.max_speed
		player.sprite.flip_h = player.velocity.x < 0
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.max_speed)
 
func end_shoot():
	if !player.is_on_floor():
		Transitioned.emit(self,"fall")
	if player.velocity.is_zero_approx():
		Transitioned.emit(self,"idle")
	else:
		Transitioned.emit(self,"walk")

func shoot():
	print_debug("atirei!")
	var b = bullet.instantiate()
	if player.sprite.flip_h:
		b.speed *= -1
	get_tree().get_first_node_in_group("Fase").add_child(b)
	b.transform = mira.global_transform

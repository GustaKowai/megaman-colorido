extends State
var player:Player
@export var bullet:PackedScene
@export var bullet_explosion:PackedScene
@onready var mira: Marker2D = $"../../Sprite2D/mira"
@onready var shoot_sound: AudioStreamPlayer = $shoot_sound

func _ready() -> void:
	super()
	player = target

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
	if Input.is_action_just_pressed("ui_up") and player.is_on_floor():
			player.velocity.y = player.JUMP_VELOCITY
			end_shoot()
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
	shoot_sound.play()
	print_debug("atirei!")
	var b = bullet.instantiate()
	if player.sprite.flip_h:
		mira.position.x = -30
		b.speed *= -1
	if bullet_explosion:
		var be = bullet_explosion.instantiate()
		get_tree().get_first_node_in_group("Fase").add_child(be)
		be.transform = mira.global_transform
	get_tree().get_first_node_in_group("Fase").add_child(b)
	b.transform = mira.global_transform
	mira.position.x = 30

extends State
class_name ShootEnemy
@onready var timer: Timer = $Timer
@export var bullet:PackedScene
@onready var mira: Marker2D = $"../../AnimatedSprite2D/mira"

var enemy:Enemy

func _ready() -> void:
	super()
	enemy = target

func Enter():
	if enemy.sprite:
		enemy.sprite.play("shoot")
	
	#print_debug("atirei!")
	var b = bullet.instantiate()
	if enemy.sprite.flip_h:
		b.speed *= -1
	get_tree().get_first_node_in_group("Fase").add_child(b)
	b.transform = mira.global_transform
	timer.start()

func _on_timer_timeout() -> void:
	#print_debug("timeout pro idle")
	Transitioned.emit(self,"Idle")

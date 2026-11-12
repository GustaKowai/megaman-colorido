extends Bullet
class_name BulletBomba
@onready var damage_box: DamageBox = $DamageBox

@export var explosion:PackedScene

var speedy:float = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity_vector")

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * speed * delta + transform.y * speedy
	speedy += gravity.y * delta * 10

func _on_damage_box_dealed_damage() -> void:
	explode()
	queue_free()


func _on_damage_box_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		explode()
		#print_debug("bati no tilemap")
		queue_free()

func explode():
	var e = explosion.instantiate()
	get_tree().get_first_node_in_group("Fase").add_child(e)
	e.position = global_position
	var children = e.get_children()
	for child in children:
		if child is DamageBox:
			child.damage_to = damage_box.damage_to

extends Bullet
class_name BulletBomba
@onready var damage_box: DamageBox = $DamageBox

@export var explosion:PackedScene

var speedy:float = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity_vector")
var velocity:Vector2
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	velocity.x = speed*cos(global_rotation)
	velocity.y = speed*sin(global_rotation)


func _process(delta: float) -> void:
	#global_position.x += speed * delta
	#global_position.y += speedy * delta
	#speedy += gravity.y
	#print_debug(speedy,speed)
	velocity.y += gravity.y*200 * delta
	
	position.x += velocity.x * delta * direction
	position.y += velocity.y * delta
	
	
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
	get_tree().get_first_node_in_group("Fase").add_child.call_deferred(e)
	e.position = global_position
	var children = e.get_children()
	for child in children:
		if child is DamageBox:
			child.damage_to = damage_box.damage_to

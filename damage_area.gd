extends Area2D
class_name DamageBox
@export_enum("Player","Enemy") var damage_to:String
@export var damage:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	print_debug("entrou na damage area")
	if area is HurtBox:
		if area.is_in_group(damage_to):
			var dir:int = 1 if (area.global_position.x > global_position.x) else -1
			area.take_damage(damage,dir)

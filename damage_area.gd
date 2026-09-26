extends Area2D
class_name DamageBox
signal dealed_damage
@export_enum("Player","Enemy") var damage_to:String
@export var damage:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	#print_debug("entrou na damage area")
	if area is HurtBox:
		#print_debug("tem uma Hurtbox do tipo: ",area.get_groups())
		if area.is_in_group(damage_to):
			var dir:int = 1 if (area.global_position.x > global_position.x) else -1
			area.take_damage(damage,dir)
			dealed_damage.emit()

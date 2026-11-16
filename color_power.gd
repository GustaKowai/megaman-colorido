extends Area2D
@export_enum("green","magent","blue","yellow") var power_color:String
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
		sprite_2d.play(power_color)


func _on_body_entered(body: Node2D) -> void:
	print_debug(body)
	if body.is_in_group("Player"):
		PlayerManager.update_avaiable_color.emit(power_color)
		queue_free()

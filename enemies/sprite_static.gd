extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent().is_fliped:
		flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hurt_box_died() -> void:
	visible = false

extends TileMapLayer
@export var dano = 0
@export var dano_max = 3
@onready var rachadura: AnimatedSprite2D = $rachadura

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rachadura.frame = dano


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Bullet:
		area.get_parent().queue_free()
		dano += 1
		rachadura.frame = dano
		if dano >= dano_max:
			queue_free()

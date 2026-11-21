extends AnimatedSprite2D
@export_enum("verde","magenta","azul","amarelo","vermelho") var fita_color:String


func _ready():
	GameManager.fitas_coletados[fita_color] = 0
	match fita_color:
		"verde":
			modulate = Color(Color(0.0, 1.825, 0.0, 1.0))
		"magenta":
			modulate = Color(Color(4.416, 0.0, 3.003, 1.0))
		"azul":
			modulate = Color(Color(0.0, 0.0, 4.416, 1.0))
		"amarelo":
			modulate = Color(Color(4.416, 4.283, 0.0, 1.0))
		"vermelho":
			modulate = Color(Color(4.416, 0.0, 0.0, 1.0))
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GameManager.fitas_coletados[fita_color] += 1
		print_debug(str(GameManager.fitas_coletados[fita_color]),"/", str(GameManager.fita_number_max[fita_color]))
		
		GameManager.item_coletado.emit(GameManager.fitas_coletados[fita_color],GameManager.fita_number_max[fita_color],"fita")
		
		queue_free()

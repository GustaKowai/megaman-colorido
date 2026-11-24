extends AnimatedSprite2D
@export_enum("verde","magenta","azul","amarelo","vermelho") var disquete_color:String


func _ready():
	GameManager.disquetes_coletados[disquete_color] = 0
	match disquete_color:
		"verde":
			modulate = Color(Color(0.0, 1.825, 0.0))
		"magenta":
			modulate = Color(Color(1.825, 0.0, 1.231))
		"azul":
			modulate = Color(Color(0.0, 0.0, 1.825))
		"amarelo":
			modulate = Color(Color(1.825, 1.769, 0.0, 1.0))
		"vermelho":
			modulate = Color(Color(1.825, 0.0, 0.0))
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GameManager.disquetes_coletados[disquete_color] += 1
		print_debug(str(GameManager.disquetes_coletados[disquete_color]),"/", str(GameManager.disquete_number_max[disquete_color]))
		
		GameManager.item_coletado.emit(GameManager.disquetes_coletados[disquete_color],GameManager.disquete_number_max[disquete_color],"disquete")
		queue_free()

extends Enemy

var limite_subida:float
var posicao_inicial_x:float

func _ready() -> void:
	limite_subida = global_position.y
	posicao_inicial_x = global_position.x

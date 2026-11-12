extends Enemy
@export var inclinacao_tiro:float = 0
@export var tempo_tiro:float = 0
@export var delay_primeiro_tiro:float = 0
@onready var mira: Marker2D = %mira


func _ready() -> void:
	super()
	if inclinacao_tiro != mira.rotation_degrees and inclinacao_tiro >0:
		mira.rotation_degrees = inclinacao_tiro

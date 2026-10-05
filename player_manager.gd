extends Node
var player_dash_cooldown:float
var player_heal_bar:int
var dash_cooldown:float
var player_jump_count: int
signal update_maximum #Usado em ui_jogador, emitido em heal
signal heal_update_signal #Usado em ui_jogador, emitido em heal
signal dash_update_signal #Usado em ui_jogador, emitido em dash
signal change_UI_color #Usando em ui_jogador, emitido em protagonist

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	heal_update_signal.connect(heal_change)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func heal_change(value):
	player_heal_bar = value

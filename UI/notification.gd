extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $ColorRect/Label
@onready var fita: TextureRect = $ColorRect/Fita
@onready var disquete: TextureRect = $ColorRect/Disquete

func _ready() -> void:
	GameManager.item_coletado.connect(pop_in)

func pop_in(coletados,totais,origem):
	animation_player.play("pop-in")
	if origem == "disquete":
		disquete.visible = true
		fita.visible = false
	if origem == "fita":
		disquete.visible = false
		fita.visible = true
	label.text = str(coletados) + "/" + str(totais)
		

extends CanvasLayer
@export var player:Player
@onready var progress_bar: ProgressBar = %LifeBar
@onready var dash_bar = %DashBar
@onready var heal_bar = %HealBar
@onready var Shield_bar = %ShieldBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerManager.update_maximum.connect(update_max)
	var target = player
	var target_childrens = target.get_children()
	for children in target_childrens:
		if children is HurtBox:
			#print_debug("achei hurtBox ",name)
			children.damaged.connect(on_hurt_box_changed)
			children.healed.connect(on_hurt_box_changed)
			children.died.connect(on_hurt_box_died)
			progress_bar.max_value = children.max_life
			progress_bar.value = progress_bar.max_value


func _process(delta: float) -> void:
	heal_bar.value = PlayerManager.player_heal_bar

func on_hurt_box_changed(life):
	progress_bar.value = life
	
func on_hurt_box_died():
	progress_bar.value = 0

func update_max():
	print_debug("maximo atualizado")
	heal_bar.max_value = PlayerManager.player_heal_bar

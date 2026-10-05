extends CanvasLayer
@export var player:Player
@onready var life_bar: ProgressBar = %LifeBar
@onready var dash_bar = %DashBar
@onready var heal_bar = %HealBar
@onready var Shield_bar = %ShieldBar
@onready var life_label: Label = %LifeLabel
@onready var heal_label: Label = %HealLabel
@onready var ui_container: VBoxContainer = %uiContainer
@onready var green_container: MarginContainer = %greenContainer
@onready var yellow_containar: MarginContainer = %yellowContainar
@onready var blue_container: VBoxContainer = %blueContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Conexões dos sinais do player Manager
	PlayerManager.change_UI_color.connect(change_ui)
	PlayerManager.update_maximum.connect(update_max)
	PlayerManager.heal_update_signal.connect(heal_update)
	PlayerManager.dash_update_signal.connect(dash_update)
	var target = player
	var target_childrens = target.get_children()
	for children in target_childrens:
		if children is HurtBox:
			#print_debug("achei hurtBox ",name)
			children.damaged.connect(on_hurt_box_changed)
			children.healed.connect(on_hurt_box_changed)
			children.died.connect(on_hurt_box_died)
			life_bar.max_value = children.max_life
			life_bar.value = life_bar.max_value
			life_label.text = str(life_bar.value)+"/"+str(life_bar.max_value) 


func _process(_delta: float) -> void:
	heal_bar.value = PlayerManager.player_heal_bar

func on_hurt_box_changed(life):
	life_bar.value = life
	life_label.text = str(life_bar.value)+"/"+str(life_bar.max_value) 
	
func on_hurt_box_died():
	life_bar.value = 0

func update_max():
	print_debug("maximo atualizado")
	heal_bar.max_value = PlayerManager.player_heal_bar
	dash_bar.max_value = PlayerManager.dash_cooldown
	heal_label.text = str(heal_bar.value)+"/"+str(heal_bar.max_value) 
	
func heal_update(value):
	heal_bar.value = value
	heal_label.text = str(heal_bar.value)+"/"+str(heal_bar.max_value) 

func dash_update(value):
	dash_bar.value = value

func change_ui(color:String):
	green_container.visible = false
	yellow_containar.visible = false
	blue_container.visible = false
	match color:
		"red":
			pass
		"green":
			green_container.visible = true
		"yellow":
			yellow_containar.visible = true
		"blue":
			blue_container.visible = true

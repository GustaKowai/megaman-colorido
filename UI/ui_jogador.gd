extends CanvasLayer
@export var player:Player
@onready var life_bar: TextureProgressBar = %LifeBar
@onready var dash_bar = %DashBar
@onready var heal_bar = %HealBar
@onready var Shield_bar = %ShieldBar
#@onready var life_label: Label = %LifeLabel
#@onready var heal_label: Label = %HealLabel
@onready var ui_container: VBoxContainer = %uiContainer
@onready var green_container: MarginContainer = %greenContainer
@onready var yellow_containar: MarginContainer = %yellowContainar
@onready var blue_container: VBoxContainer = %blueContainer
@onready var jump_counter: TextureProgressBar = %JumpCounter
@onready var music: AudioStreamPlayer = $"../music"
@onready var outline: Sprite2D = $Gear/Outline

# Sprites das esferas de cores
@onready var blue_off: Sprite2D = $Gear/BlueOrb/BlueOff
@onready var blue_on: Sprite2D = $Gear/BlueOrb/BlueOn
@onready var green_off: Sprite2D = $Gear/GreenOrb/GreenOff
@onready var green_on: Sprite2D = $Gear/GreenOrb/GreenOn
@onready var magenta_off: Sprite2D = $Gear/MagentOrb/MagentaOff
@onready var magenta_on: Sprite2D = $Gear/MagentOrb/MagentaOn
@onready var yellow_off: Sprite2D = $Gear/YellowOrb/YellowOff
@onready var yellow_on: Sprite2D = $Gear/YellowOrb/YellowOn
@onready var blue_orb: Sprite2D = $Gear/BlueOrb
@onready var green_orb: Sprite2D = $Gear/GreenOrb
@onready var magent_orb: Sprite2D = $Gear/MagentOrb
@onready var yellow_orb: Sprite2D = $Gear/YellowOrb

@export var outlines:Array[Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	blue_orb.visible = PlayerManager.blue_power
	magent_orb.visible = PlayerManager.magent_power
	green_orb.visible = PlayerManager.green_power
	yellow_orb.visible = PlayerManager.yellow_power
	# Conexões dos sinais do player Manager
	if music:
		music.play()
	PlayerManager.change_UI_color.connect(change_ui)
	PlayerManager.update_maximum.connect(update_max)
	PlayerManager.heal_update_signal.connect(heal_update)
	PlayerManager.dash_update_signal.connect(dash_update)
	PlayerManager.jump_update_signal.connect(jump_update)
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
			#life_label.text = str(life_bar.value)+"/"+str(life_bar.max_value) 


func _process(_delta: float) -> void:
	heal_bar.value = PlayerManager.player_heal_bar

func on_hurt_box_changed(life):
	life_bar.value = life
	#life_label.text = str(life_bar.value)+"/"+str(life_bar.max_value) 
	
func on_hurt_box_died():
	life_bar.value = 0

func update_max():
	#print_debug("maximo atualizado")
	heal_bar.max_value = PlayerManager.player_heal_bar
	dash_bar.max_value = PlayerManager.dash_cooldown
	jump_counter.max_value = PlayerManager.player_jump_max
	#heal_label.text = str(heal_bar.value)+"/"+str(heal_bar.max_value) 
	
func heal_update(value):
	heal_bar.value = value
	#heal_label.text = str(heal_bar.value)+"/"+str(heal_bar.max_value) 

func dash_update(value):
	dash_bar.value = dash_bar.max_value-value
	
func jump_update(value):
	jump_counter.value = jump_counter.max_value-value

func change_ui(color:String):
	green_container.visible = false
	yellow_containar.visible = false
	blue_container.visible = false
	blue_off.visible = true
	green_off.visible = true
	magenta_off.visible = true
	yellow_off.visible = true
	blue_on.visible = false
	green_on.visible = false
	magenta_on.visible = false
	yellow_on.visible = false
	match color:
		"magent":
			magenta_off.visible = false
			magenta_on.visible = true
			outline.texture = outlines[1]
			pass
		"green":
			green_off.visible = false
			green_on.visible = true
			outline.texture = outlines[0]
			green_container.visible = true
		"yellow":
			yellow_off.visible = false
			yellow_on.visible = true
			outline.texture = outlines[3]
			yellow_containar.visible = true
		"blue":
			blue_off.visible = false
			blue_on.visible = true
			outline.texture = outlines[2]
			blue_container.visible = true
		_:
			pass

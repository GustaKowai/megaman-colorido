extends CharacterBody2D
class_name Player

signal game_over

@onready var gray: State_machine = $gray
@onready var green: State_machine = $green
@onready var magent: State_machine = $magent
@onready var blue: State_machine = $blue
@onready var yellow: State_machine = $yellow
@onready var sprite: Sprite2D = $Sprite2D
@onready var explosion: Sprite2D = $Explosion
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var efeitos: Sprite2D = $efeitos
@onready var animationeffect: AnimationPlayer = $Animationeffect
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var color_change: AudioStreamPlayer = $color_change

@export var sprite_gray:Texture2D
@export var sprite_green:Texture2D
@export var sprite_magent:Texture2D
@export var sprite_blue:Texture2D
@export var sprite_yellow:Texture2D

@export var sprite_gray_explosion:Texture2D
@export var sprite_green_explosion:Texture2D
@export var sprite_magent_explosion:Texture2D
@export var sprite_blue_explosion:Texture2D
@export var sprite_yellow_explosion:Texture2D


@export var max_speed = 300.0
const JUMP_VELOCITY = -450.0
var green_power:bool = false
var magent_power:bool = false
var blue_power:bool = false
var yellow_power:bool = false
var just_damaged:bool = false
var is_game_over:bool = false
var transform_disabled:bool = false

func _ready() -> void:
	green_power = PlayerManager.green_power
	magent_power = PlayerManager.magent_power
	blue_power = PlayerManager.blue_power
	yellow_power = PlayerManager.yellow_power
	#print_debug(green,magent)
	sprite.texture = sprite_gray
	explosion.texture = sprite_gray_explosion
	PlayerManager.change_UI_color.emit("off")
	gray.process_mode = Node.PROCESS_MODE_INHERIT
	green.process_mode = Node.PROCESS_MODE_DISABLED
	magent.process_mode = Node.PROCESS_MODE_DISABLED
	blue.process_mode = Node.PROCESS_MODE_DISABLED
	yellow.process_mode = Node.PROCESS_MODE_DISABLED
	PlayerManager.update_avaiable_color.connect(update_powers)

func _process(_delta: float) -> void:
	if !is_game_over:
		check_color()
	

func _physics_process(_delta: float) -> void:
	if !is_game_over:
		move_and_slide()

func check_color():
	if transform_disabled:
		return
	if Input.is_action_just_pressed("cor-1") and green.process_mode != Node.PROCESS_MODE_INHERIT and green_power:
		color_change.play()
		animationeffect.play("transform_green")
		print_debug("verde")
		point_light_2d.color = Color.GREEN
		sprite.texture = sprite_green
		explosion.texture = sprite_green_explosion
		green.process_mode = Node.PROCESS_MODE_INHERIT
		magent.process_mode = Node.PROCESS_MODE_DISABLED
		blue.process_mode = Node.PROCESS_MODE_DISABLED
		yellow.process_mode = Node.PROCESS_MODE_DISABLED
		gray.process_mode = Node.PROCESS_MODE_DISABLED
		PlayerManager.change_UI_color.emit("green")
	if Input.is_action_just_pressed("cor-2") and magent.process_mode != Node.PROCESS_MODE_INHERIT and magent_power:
		color_change.play()
		animationeffect.play("transform_magent")
		print_debug("magenta")
		point_light_2d.color = Color.MAGENTA
		sprite.texture = sprite_magent
		explosion.texture = sprite_magent_explosion
		magent.process_mode = Node.PROCESS_MODE_INHERIT
		green.process_mode = Node.PROCESS_MODE_DISABLED
		blue.process_mode = Node.PROCESS_MODE_DISABLED
		yellow.process_mode = Node.PROCESS_MODE_DISABLED
		gray.process_mode = Node.PROCESS_MODE_DISABLED
		PlayerManager.change_UI_color.emit("magent")
	if Input.is_action_just_pressed("cor-3") and blue.process_mode != Node.PROCESS_MODE_INHERIT and blue_power:
		color_change.play()
		animationeffect.play("transform_blue")
		print_debug("azul")
		point_light_2d.color = Color.POWDER_BLUE
		sprite.texture = sprite_blue
		explosion.texture = sprite_blue_explosion
		blue.process_mode = Node.PROCESS_MODE_INHERIT
		magent.process_mode = Node.PROCESS_MODE_DISABLED
		green.process_mode = Node.PROCESS_MODE_DISABLED
		yellow.process_mode = Node.PROCESS_MODE_DISABLED
		gray.process_mode = Node.PROCESS_MODE_DISABLED
		PlayerManager.change_UI_color.emit("blue")
	if Input.is_action_just_pressed("cor-4") and yellow.process_mode != Node.PROCESS_MODE_INHERIT and yellow_power:
		PlayerManager.change_UI_color.emit("yellow")
		color_change.play()
		animationeffect.play("transform_yellow")
		print_debug("amarelo")
		point_light_2d.color = Color.YELLOW
		sprite.texture = sprite_yellow
		explosion.texture = sprite_yellow_explosion
		yellow.process_mode = Node.PROCESS_MODE_INHERIT
		magent.process_mode = Node.PROCESS_MODE_DISABLED
		blue.process_mode = Node.PROCESS_MODE_DISABLED
		green.process_mode = Node.PROCESS_MODE_DISABLED
		gray.process_mode = Node.PROCESS_MODE_DISABLED

func call_game_over():
	is_game_over = true
	game_over.emit()

func update_powers(_color:String):
	green_power = PlayerManager.green_power
	magent_power = PlayerManager.magent_power
	blue_power = PlayerManager.blue_power
	yellow_power = PlayerManager.yellow_power

func disable_transform():
	transform_disabled = true
	

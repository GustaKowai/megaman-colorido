extends CharacterBody2D
class_name Player
@onready var green: State_machine = $green
@onready var red: State_machine = $red
@onready var blue: State_machine = $blue
@onready var yellow: State_machine = $yellow
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var efeitos: Sprite2D = $efeitos
@onready var animationeffect: AnimationPlayer = $Animationeffect
@onready var point_light_2d: PointLight2D = $PointLight2D

@export var sprite_green:Texture2D
@export var sprite_red:Texture2D
@export var sprite_blue:Texture2D
@export var sprite_yellow:Texture2D

@export var max_speed = 300.0
const JUMP_VELOCITY = -450.0


func _ready() -> void:
	#print_debug(green,red)
	sprite.texture = sprite_green
	green.process_mode = Node.PROCESS_MODE_INHERIT
	red.process_mode = Node.PROCESS_MODE_DISABLED
	blue.process_mode = Node.PROCESS_MODE_DISABLED
	yellow.process_mode = Node.PROCESS_MODE_DISABLED
	

func _process(_delta: float) -> void:
	check_color()
	

func _physics_process(_delta: float) -> void:
	move_and_slide()

func check_color():
	if Input.is_action_just_pressed("cor-1") and green.process_mode != Node.PROCESS_MODE_INHERIT:
		animationeffect.play("transform_green")
		print_debug("verde")
		point_light_2d.color = Color.GREEN
		sprite.texture = sprite_green
		green.process_mode = Node.PROCESS_MODE_INHERIT
		red.process_mode = Node.PROCESS_MODE_DISABLED
		blue.process_mode = Node.PROCESS_MODE_DISABLED
		yellow.process_mode = Node.PROCESS_MODE_DISABLED
	if Input.is_action_just_pressed("cor-2") and red.process_mode != Node.PROCESS_MODE_INHERIT:
		animationeffect.play("transform_red")
		print_debug("vermelho")
		point_light_2d.color = Color.PALE_VIOLET_RED
		sprite.texture = sprite_red
		red.process_mode = Node.PROCESS_MODE_INHERIT
		green.process_mode = Node.PROCESS_MODE_DISABLED
		blue.process_mode = Node.PROCESS_MODE_DISABLED
		yellow.process_mode = Node.PROCESS_MODE_DISABLED
	if Input.is_action_just_pressed("cor-3") and blue.process_mode != Node.PROCESS_MODE_INHERIT:
		animationeffect.play("transform_blue")
		print_debug("azul")
		point_light_2d.color = Color.POWDER_BLUE
		sprite.texture = sprite_blue
		blue.process_mode = Node.PROCESS_MODE_INHERIT
		red.process_mode = Node.PROCESS_MODE_DISABLED
		green.process_mode = Node.PROCESS_MODE_DISABLED
		yellow.process_mode = Node.PROCESS_MODE_DISABLED
	if Input.is_action_just_pressed("cor-4") and yellow.process_mode != Node.PROCESS_MODE_INHERIT:
		animationeffect.play("transform_yellow")
		print_debug("amarelo")
		point_light_2d.color = Color.YELLOW
		sprite.texture = sprite_yellow
		yellow.process_mode = Node.PROCESS_MODE_INHERIT
		red.process_mode = Node.PROCESS_MODE_DISABLED
		blue.process_mode = Node.PROCESS_MODE_DISABLED
		green.process_mode = Node.PROCESS_MODE_DISABLED

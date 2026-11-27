extends Node2D
@export var timer_sprite:float = 1
@export var up: AnimatedSprite2D
@export var right: AnimatedSprite2D
@export var left: AnimatedSprite2D
#@export var down: AnimatedSprite2D
var global_frame:int = 0
var time_sprite:float = 0
@onready var action= $action
@onready var action2: AnimatedSprite2D = $"../controle2/action"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if PlayerManager.green_power:
		action.visible = true
		action2.visible = true
	sync_sprites()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_sprite += delta
	if time_sprite > timer_sprite:
		if global_frame == 0:
			global_frame = 1
			print_debug("frame 1", global_frame)
			time_sprite = 0
		else:
			global_frame = 0
			print_debug("frame 0")
			time_sprite = 0
	sync_sprites()
	
func sync_sprites():
	up.frame = global_frame
	right.frame = global_frame
	left.frame = global_frame
	#down.frame = global_frame

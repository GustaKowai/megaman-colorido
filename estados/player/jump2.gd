extends jump
var jump_max:int = 3
var jump_atual:int = 1

func _ready() -> void:
	super()
	PlayerManager.player_jump_max = jump_max
	PlayerManager.jump_update_signal.emit(0)
	PlayerManager.update_maximum.emit()

func Enter():
	if jump_atual < jump_max:
		super()
		jump_atual += 1
	PlayerManager.jump_update_signal.emit(jump_atual)
	print_debug(jump_atual)
	#print_debug("entrei no red")

func Physics_update(_delta: float):
	super(_delta)
	if Input.is_action_just_pressed("ui_up") and jump_atual < jump_max:
		#print_debug(jump_atual)
	#if jump_atual < jump_max:
		#if Input.is_action_just_pressed("ui_up"):
		player.animation_player.play("jump")
		player.velocity.y = player.JUMP_VELOCITY
		jump_atual += 1
		PlayerManager.jump_update_signal.emit(jump_atual)
		print_debug(jump_atual)

	
func _process(_delta: float) -> void:
	if player.is_on_floor() and jump_atual != 0:
		jump_atual = 0
		PlayerManager.jump_update_signal.emit(jump_atual)

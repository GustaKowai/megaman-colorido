extends jump
var jump_max:int = 4
var jump_atual:int = 1

func Enter():
	if player.is_on_floor():
		jump_atual = 1
	else:
		jump_atual = 2
	super()
	print_debug(jump_atual)
	#print_debug("entrei no red")

func Physics_update(_delta: float):
	super(_delta)
	if Input.is_action_just_pressed("ui_up"):
		print_debug(jump_atual)
	if jump_atual < jump_max:
		if Input.is_action_just_pressed("ui_up"):
			player.animation_player.play("jump")
			player.velocity.y = player.JUMP_VELOCITY
			jump_atual += 1

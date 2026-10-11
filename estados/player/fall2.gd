extends fall

func Enter():
	super()

func Physics_update(_delta: float):
	super(_delta)
	if Input.is_action_just_pressed("ui_up"):
		Transitioned.emit(self,"jump")

extends IdleEnemy



func Update(_delta: float):
	Transitioned.emit(self,"dash")

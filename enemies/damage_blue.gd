extends DamageState

func Exit():
	target.velocity.x = 0
	target.modulate = original_color

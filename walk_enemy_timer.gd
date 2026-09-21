extends WalkEnemy
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

@onready var timer: Timer = $Timer

func Enter():
	direction *= -1
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
	super()
	timer.start()


func _on_timer_timeout() -> void:
	print_debug("timeout pro idle")
	Transitioned.emit(self,"Idle")

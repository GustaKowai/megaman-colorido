extends IdleEnemy

@onready var timer: Timer = $Timer

func _ready() -> void:
	super()
	if target.delay_primeiro_tiro != timer.wait_time and target.delay_primeiro_tiro > 0:
		timer.wait_time = target.delay_primeiro_tiro


func Enter():
	#print_debug("Idle timer")
	if enemy.sprite:
		enemy.sprite.play("idle")
	if timer:
		timer.start()

func _on_timer_timeout():
	if target.tempo_tiro:
		if target.tempo_tiro != timer.wait_time and target.tempo_tiro > 0:
			timer.wait_time = target.tempo_tiro
	Transitioned.emit(self,"Shoot")

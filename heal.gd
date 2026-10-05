extends State
class_name Heal

@export var heal_amount: int
@export var heal_speed:float
@export var heal_bar_max:int
@export var hurtbox:HurtBox
@export var particles: CPUParticles2D

var player:Player
var heal_bar:int
var heal_time:float

func _ready() -> void:
	super()
	player = target
	PlayerManager.player_heal_bar = heal_bar_max
	PlayerManager.update_maximum.emit()

func Enter():
	player.animation_player.play("heal")
	heal_time = heal_speed
	
func Update(delta: float):
	charge_heal(delta)
	if Input.is_action_just_released("action"):
		end_heal()
	
	
	
func charge_heal(delta):
	heal_time -= delta
	if heal_time <= 0 and PlayerManager.player_heal_bar > 0:
		particles.emitting = true
		PlayerManager.player_heal_bar -= heal_amount
		hurtbox.give_heal(heal_amount)
		heal_time = heal_speed
		
func end_heal():
	if !player.is_on_floor():
		Transitioned.emit(self,"fall")
	if player.velocity.is_zero_approx():
		Transitioned.emit(self,"idle")
	else:
		Transitioned.emit(self,"walk")

extends WalkEnemy

@onready var raycast_v: RayCast2D = $"../../RayCastVertical"
@onready var raycast_h: RayCast2D = $"../../RayCastHorizontal"


func Enter():
	super()

func Physics_update(_delta: float):
	super(_delta)
	#enemy.velocity.x = direction * enemy.speed
	if not raycast_v.is_colliding() || raycast_h.is_colliding():
		direction = -direction
		raycast_v.position.x = -raycast_v.position.x
		raycast_h.position.x = -raycast_h.position.x
		raycast_h.target_position.x *= -1
		enemy.sprite.flip_h = direction < 0
	
	#if raycast_h.is_colliding():
		#print_debug("colidindo")
	#if !raycast_v.is_colliding():
		#print_debug("nenhuma colisao")

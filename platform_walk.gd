extends WalkEnemy

@onready var raycast: RayCast2D = $"../../RayCast2D"

func Enter():
	super()

func Physics_update(_delta: float):
	enemy.velocity.x = direction * enemy.speed
	if not raycast.is_colliding():
		direction = -direction
		raycast.position.x = -raycast.position.x
		enemy.sprite.scale.x = -enemy.sprite.scale.x

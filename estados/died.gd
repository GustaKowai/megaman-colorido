extends State
class_name DiedState
var sprite

func Enter():
	if target.is_in_group("Player"):
		target.animation_player.play("die")
	if target.is_in_group("Enemy"):
		sprite = target.sprite
		target.sprite.play("die")


func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "die":
		target.queue_free()

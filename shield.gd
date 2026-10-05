extends Area2D
class_name Shield

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is Bullet:
		var bullet:Bullet = area.get_parent()
		bullet.speed *= -1
		var children = bullet.get_children()
		for child in children:
			if child is DamageBox:
				child.damage_to = "Enemy"

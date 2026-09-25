extends State
@export var target:CharacterBody2D

func Enter():
	target.animation_player.play("damage")

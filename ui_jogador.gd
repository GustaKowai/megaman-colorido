extends CanvasLayer
@export var player:Player
@onready var progress_bar: ProgressBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var target = player
	var target_childrens = target.get_children()
	for children in target_childrens:
		if children is HurtBox:
			#print_debug("achei hurtBox ",name)
			children.damaged.connect(on_hurt_box_damaged)
			children.died.connect(on_hurt_box_died)
			progress_bar.max_value = children.max_life
			progress_bar.value = progress_bar.max_value


func on_hurt_box_damaged(life):
	progress_bar.value = life
	
func on_hurt_box_died():
	progress_bar.value = 0

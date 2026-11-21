extends Area2D
signal exit_level
@export var level_number:int
@export_enum("verde","magenta","azul","amarelo","vermelho") var disquete_color_check:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if disquete_color_check:
		GameManager.Update_recordes(disquete_color_check)
	exit_level.emit(body,level_number)

extends Node
class_name State_machine

@export var initial_state: State

var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	
	if initial_state:
		initial_state.Enter()
		current_state = initial_state
		
func _process(delta: float) -> void:
	#print_debug(current_state)
	if current_state:
		current_state.Update(delta)
	
func _physics_process(delta: float) -> void:
	##print_debug(current_state)
	if current_state:
		current_state.Physics_update(delta)

func on_child_transition(state:State, new_state_name):
	if state != current_state:
		return
	#print_debug(state," ",new_state_name," ",get_parent())
	var new_state = states.get(new_state_name.to_lower())
	#print_debug(states.get_children)
	if !new_state:
		print_debug("não achei o ",new_state)
		return
	
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	#print_debug(new_state)
		
	current_state = new_state

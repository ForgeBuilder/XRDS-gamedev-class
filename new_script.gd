extends CharacterBody2D


var has_double_jump : bool = false

var jump_velocity = 100

func _physics_process(delta: float) -> void:
	if is_on_floor():
		has_double_jump = true

	
	if Input.is_action_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = jump_velocity
			pass
		else:
			if has_double_jump:
				velocity.y = jump_velocity
				has_double_jump = false
	

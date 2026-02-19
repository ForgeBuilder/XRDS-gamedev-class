extends CharacterBody2D





func _physics_process(delta: float) -> void:
	
	var left_right_input = Input.get_axis("ui_left","ui_right")
	
	print(left_right_input)
	#velocity = 
